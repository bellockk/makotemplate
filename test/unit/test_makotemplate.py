"""Tests for `makotemplate` package."""
import sys
import pathlib
import unittest
import SCons.Script

sys.path.insert(0, str(pathlib.Path(__file__).parents[2].absolute()))
import makotemplate



class TestMakoTemplate(unittest.TestCase):
    """Tests for `makotemplate` package."""

    def setUp(self):
        """Set up test fixtures, if any."""

    def tearDown(self):
        """Tear down test fixtures, if any."""

    def test_generate(self):
        """Adding tool to Environment"""
        env = SCons.Script.Environment()
        makotemplate.generate(env)
        self.assertIn('Mako', env['BUILDERS'])
