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


static void		test_ft_strcat(void)
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
	int			tests[5] = {'a', 'G', 'b', '?', 'h'};
	int			p;
	char		c;

	printf("%s", "testing for ft_is*...\n");
	p = 0;
	while  (p < 5)
	{
		c = (char)tests[p++];
		printf("char: %c - ft_islower: %d - ft_isupper: %d - ft_isalpha: %d\n",
				c, ft_islower(c), ft_isupper(c), ft_isalpha(c));
	}
	printf("%s", "test done.\n");
}

int				main(void)
{
	test_ft_bzero();
	test_ft_strcat();
	test_isall();
	return (0);
}
