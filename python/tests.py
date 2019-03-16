import unittest

target = __import__("mustache.py")
mustache = target.mustache

class TestMustache(unittest.TestCase):
    def test_list_int(self):
        """
        Test that it can sum a list of integers
        """
        template = "Hello {{person}}!"

        hash = {
            "person" : "world"
        }

        getRenderedTemplate(template,hash)


        self.assertEqual('Hello world!', 'Hello world!')