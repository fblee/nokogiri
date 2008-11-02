
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

require 'dom_test_case'

###
#     The "getNotations()" method creates a NamedNodeMap that   
#    contains all the notations declared in the DTD.
#    
#    Retrieve the Document Type for this document and create
#    a NamedNodeMap object of all the notations.  There
#    should be two items in the list (notation1 and notation2).
# @author NIST
# @author Mary Brady
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-D46829EF]
##
DOMTestCase('documenttypegetnotations') do

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
  def test_documenttypegetnotations
    doc = nil
    docType = nil
    notationList = nil
    notation = nil
    notationName = nil
    actual = []
      
    expected = []
      expected << "notation1"
      expected << "notation2"
      
    doc = load_document("staff", false)
      docType = doc.doctype()
      assert_not_nil(docType, "docTypeNotNull")
      notationList = docType.notations()
      assert_not_nil(notationList, "notationsNotNull")
      indexid1460810 = 0
    while (indexid1460810 < notationList.length)
      notation = notationList.item(indexid1460810)
    notationName = notation.nodeName()
      actual << notationName
      indexid1460810 += 1
            end
      assert_equal(expected, actual, "names")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documenttypegetnotations"
  end
end

