
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
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

require 'dom_test_case'

###
#     The "splitText(offset)" method breaks the Text node into
#     two Text nodes at the specified offset keeping each node
#     as siblings in the tree.
#     
#     Retrieve the textual data from the second child of the 
#     third employee and invoke the "splitText(offset)" method.
#     The method splits the Text node into two new sibling
#     Text nodes keeping both of them in the tree.   This test
#     checks the "nextSibling()" method of the original node
#     to ensure that the two nodes are indeed siblings.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-38853C1D]
##
DOMTestCase('textsplittextone') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_textsplittextone
    doc = nil
    elementList = nil
    nameNode = nil
    textNode = nil
    splitNode = nil
    secondPart = nil
    value = nil
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("name")
      nameNode = elementList.item(2)
      textNode = nameNode.firstChild()
      splitNode = textNode.splitText(7)
      secondPart = textNode.nextSibling()
      value = secondPart.nodeValue()
      assert_equal("Jones", value, "textSplitTextOneAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/textsplittextone"
  end
end

