#include "libfts.h"
#include <stdlib.h>
#include <stdio.h>

static int		is_zero(const void *ptr, const size_t size)
{
	size_t		p;

	p = 0;
	while ((p < size) &&  (((char*)ptr)[p] == 0))
		p++;
	return (p != size);
}

static void		test_ft_bzero(void)
{
	char		test[100];

	printf("%s", "testing ft_bzero...\n");
	ft_bzero(test, 100);
	printf("ft_bzero: %s\n", (is_zero(test, 100) ? "failed" : "passed"));
}

static void		test_ft_strcat()
{
	char		buffer[200];

	printf("%s", "testing ft_strcat...\n");
	buffer[0] = '\0';
	ft_strcat(buffer, "hello world");
	printf("test0: %s\n", buffer);
	ft_strcat(buffer, " this is the end part");
	printf("test1: %s\n", buffer);
}

static void		test_isall(void)
{
	int			tests[11] = {'a', 'A', 'G', 'b', '?', 'h', '0', '9', '5', '\0', 0xff};
	int			p;
	char		c;

	printf("%s", "testing for ft_is*...\n");
	p = 0;
	while  (p < 11)
	{
		c = (char)tests[p++];
		printf("char: %c - ft_islower: %d - ft_isupper: %d - ft_isalpha: %d - ft_isdigit: %d - ft_isprint: %d - ft_toupper: %c - ft_tolower: %c\n",
				c, ft_islower(c), ft_isupper(c), ft_isalpha(c), ft_isdigit(c),
				ft_isprint(c), (char)ft_toupper(c), (char)ft_tolower(c));
	}
	printf("%s", "test done.\n");
}

static void		test_ft_strlen(void)
{
	const char		*str;

	printf("%s", "testing for ft_strlen...\n");
	str = "hello world";;
	printf("%s -> %lu\n", str, ft_strlen(str));
}

static void		test_ft_memset(void)
{
	int			buffa[100];
	int			buffb[100];

	printf("%s", "testing ft_memset...\n");
	memset(buffa, 0xfa, sizeof(int) * 100);
	ft_memset(buffb, 0xfa, sizeof(int) * 100);
	printf("test0: %s\n",
			(memcmp(buffa, buffb, sizeof(int) * 100)) ? "Failed" : "Success");
}

static void		test_ft_memcpy(void)
{
	int		abuff[100];
	int		bbuff[100];

	printf("%s", "testing ft_memcpy...\n");
	ft_memcpy(bbuff, abuff, sizeof(int) *  100);
	printf("test0: %s\n",
			memcmp(abuff, bbuff, sizeof(int) * 100) ? "Failed" : "Success");
}

int				main(void)
{
	test_ft_bzero();
	test_ft_strcat();
	test_isall();
	test_ft_strlen();
	test_ft_memset();
	test_ft_memcpy();
	ft_puts("testing puts");
	ft_puts(NULL);
	return (0);
}
