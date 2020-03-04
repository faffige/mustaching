import unittest

from mustache import getRenderedTemplate

class TestMustache(unittest.TestCase):
    def test_list_int(self):

        template = "Hello {{person}}!"

        hash = {
            "person" : "world"
        }

        result = getRenderedTemplate(template,hash)

        self.assertEqual(result, 'Hello world!')


if __name__ == '__main__':
    unittest.main()