
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
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
#     The "cloneNode(deep)" method does not copy text unless it
#     is deep cloned.(Test for deep=true)
#     
#     Retrieve the eighth child of the second employee and
#     the "cloneNode(deep)" method with deep=true.   The
#     duplicate node returned by the method should copy
#     any text data contained in this node.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-3A0ED0A4]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=246]
##
DOMTestCase('hc_nodeclonetruecopytext') do

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
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_nodeclonetruecopytext
    doc = nil
    elementList = nil
    childNode = nil
    clonedNode = nil
    lastChildNode = nil
    childValue = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("sup")
      childNode = elementList.item(1)
      clonedNode = childNode.cloneNode(true)
      lastChildNode = clonedNode.lastChild()
      childValue = lastChildNode.nodeValue()
      assert_equal("35,000", childValue, "cloneContainsText")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodeclonetruecopytext"
  end
end

