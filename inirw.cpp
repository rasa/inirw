// $Id$


// Read and write .ini files
// Copyright (c) 2004, Ross Smith. All Rights Reserved

// \TODO add getopt library:
// inirw -v | --verbose
// inirw -h | --help

#include <string>		// string
#include <stdarg.h>		// va_start

void error(char *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	vfprintf(stderr, fmt, args);
	if (errno)
		fprintf(stderr, strerror(errno));
	fprintf(stderr, "\n");
	va_end(args);
	exit(1);
}

void usage(char *arg0) {
	fprintf(stderr, "Usage: %s filename.ini section key [new_value]\n", arg0);
	exit(1);
}

char *trim(char *s) {
	char *start = s;

	while (isspace(*start))
		++start;

	char *end = start + strlen(start) - 1;

	while (isspace(*end) && end >= start)
		--end;

	int len = end - start + 1;

	char *p = new char[len + 1];
	strncpy(p, start, len);
	p[len] = '\0';

	return p;
}

int main(int argc, char **argv)
{
   if (argc < 4) {
		usage(argv[0]);
   }

	std::string name	= argv[1];
	std::string section = argv[2];
	std::string key		= argv[3];
	std::string newvalue	= argc >= 5 ? argv[4] : "";

	std::string name_bak = name + ".bak";
	std::string name_tmp = name + ".tmp";

	char *cname		= strdup(name.c_str());
	char *cname_bak = strdup(name_bak.c_str());
	char *cname_tmp = strdup(name_tmp.c_str());

	FILE *fp = fopen(cname, "rb");

	FILE *fp2 = NULL;

	if (newvalue.size()) {
		if (unlink(cname_tmp))
			if (errno != ENOENT)
				error("Cannot delete ", cname_tmp);

		fp2 = fopen(cname_tmp, "wb");
		if (fp2 == NULL)
			error("Cannot create ", cname_tmp);
	}

	static char p[65536];
	static char p2[65536];

	static char cur_section[256];

	bool rewrite = false;
	bool found_section = false;
	bool found_item = false;

	while (fp && !feof(fp)) {
		char *start = fgets(p, sizeof(p), fp);
		if (start == NULL) {
			break;
		}

		char *trimmed = trim(start);

		char *lastchar = trimmed + strlen(trimmed) - 1;

		while (1) {
			if (*trimmed == '[' && *lastchar == ']') {

				if (stricmp(section.c_str(), cur_section) == 0) {
					if (newvalue.size() && !found_item) {
						_snprintf(p2, sizeof(p2), "%s=%s\n\n", key.c_str(), newvalue.c_str());
						if (fputs(p2, fp2) == EOF) {
							error("Can't write to ", cname_tmp);
						}
						found_item = true;
						rewrite = true;
					}
				}

				char *p2 = trimmed;
				++p2;
				p2[strlen(p2) - 1] = '\0';
				char *p3 = trim(p2);
				strncpy(cur_section, p3, sizeof(cur_section));
				free(p3);
				found_section = true;
				break;
			}

			if (*trimmed == ';') {
				break;
			}

			if (stricmp(section.c_str(), cur_section) == 0) {
				char *equals = strchr(trimmed, '=');
				if (equals == NULL) {
					break;
				}
				char *cur_key = trimmed;
				char *cur_value = trim(equals + 1);

				equals = strchr(cur_key, '=');
				*equals = '\0';

				cur_key = trim(cur_key);

				if (stricmp(key.c_str(), cur_key) == 0) {
					found_item = true;
					if (newvalue.size()) {
						if (strcmp(cur_value, newvalue.c_str()) != 0) {
							_snprintf(p, sizeof(p), "%s=%s\n", cur_key, newvalue.c_str());
							rewrite = true;
						}
					} else {
						printf("%s\n", cur_value);
					}
				}

				free(cur_key);
				free(cur_value);
			}


			break;
		}

		if (fp2) {
			if (fputs(p, fp2) == EOF) {
				error("Can't write to ", cname_tmp);
			}

		}
		free(trimmed);
	}

	if (fp && fclose(fp)) {
		error("Cannot close ", cname);
	}

	if (newvalue.size()) {
		if (fp2) {
			if (!found_section) {
				_snprintf(p, sizeof(p), "\n[%s]\n", section.c_str());
				if (fputs(p, fp2) == EOF) {
					error("Can't write to ", cname_tmp);
				}
				found_section = true;
				rewrite = true;
			}

			if (!found_item) {
				_snprintf(p, sizeof(p), "\n%s=%s\n", key.c_str(), newvalue.c_str());
				if (fputs(p, fp2) == EOF) {
					error("Can't write to ", cname_tmp);
				}
				found_item = true;
				rewrite = true;
			}
		}

		if (fclose(fp2)) {
			error("Cannot close ", cname_tmp);
		}

		if (rewrite) {
			if (unlink(cname_bak)) {
				if (errno != ENOENT) {
					error("Cannot delete ", cname_bak);
				}
			}
			if (fp && rename(cname, cname_bak)) {
				error("Cannot rename ", cname, " to ", cname_bak);
			}
			if (rename(cname_tmp, cname)) {
				error("Cannot rename ", cname_tmp, " to ", cname);
			}
		} else {
			(void*) unlink(cname_tmp);
		}
	}

	return 0;
}
