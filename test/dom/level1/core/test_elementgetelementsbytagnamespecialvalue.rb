
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
# The "getElementsByTagName(name)" method may use the
# special value "*" to match all tags in the element
# tree.
# Create a NodeList of all the descendant elements
# of the last employee by using the special value "*".
# The method should return all the descendant children(6)
# in the order the children were encountered.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1938918D]
##
DOMTestCase('elementgetelementsbytagnamespecialvalue') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_elementgetelementsbytagnamespecialvalue
    doc = nil
    elementList = nil
    lastEmployee = nil
    lastempList = nil
    child = nil
    childName = nil
    result = []
      
    expectedResult = []
      expectedResult << "employeeId"
      expectedResult << "name"
      expectedResult << "position"
      expectedResult << "salary"
      expectedResult << "gender"
      expectedResult << "address"
      
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("employee")
      lastEmployee = elementList.item(4)
      lastempList = lastEmployee.getElementsByTagName("*")
      indexid1649177 = 0
    while (indexid1649177 < lastempList.length)
      child = lastempList.item(indexid1649177)
    childName = child.nodeName()
      result << childName
      indexid1649177 += 1
            end
      assert_equal(expectedResult, result, "tagNames")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementgetelementsbytagnamespecialvalue"
  end
end
