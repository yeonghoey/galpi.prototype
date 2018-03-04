import ast
import re
from setuptools import find_packages, setup


def extract_version(content):
    m = re.search(r'__version__\s+=\s+(.*)', content)
    s = m.group(1)
    return str(ast.literal_eval(s))


with open('galpi/__init__.py', 'rb') as f:
    content = f.read().decode('utf-8')
    version = extract_version(content)


setup(
    name='galpi',
    version=version,

    description='Social bookmarks',
    url='https://github.com/yeonghoey/galpi',

    author='Yeongho Kim',
    author_email='yeonghoey@gmail.com',

    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'flask',
        'zappa',
    ],

    license='MIT',

    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3.6',
    ],
)
