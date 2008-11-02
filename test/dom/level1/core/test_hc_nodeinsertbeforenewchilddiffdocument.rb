
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
#     The "insertBefore(newChild,refChild)" method raises a 
#     WRONG_DOCUMENT_ERR DOMException if the "newChild" was
#     created from a different document than the one that 
#     created this node.
#     
#     Retrieve the second employee and attempt to insert a new 
#     child that was created from a different document than the
#     one that created the second employee.   An attempt to
#     insert such a child should raise the desired exception.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='WRONG_DOCUMENT_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-952280727]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-952280727')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='WRONG_DOCUMENT_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-952280727]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=247]
##
DOMTestCase('hc_nodeinsertbeforenewchilddiffdocument') do

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
    preload(contentType, "hc_staff", false)
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_nodeinsertbeforenewchilddiffdocument
    doc1 = nil
    doc2 = nil
    refChild = nil
    newChild = nil
    elementList = nil
    elementNode = nil
    insertedNode = nil
    doc1 = load_document("hc_staff", false)
      doc2 = load_document("hc_staff", true)
      newChild = doc1.createElement("br")
      elementList = doc2.getElementsByTagName("p")
      elementNode = elementList.item(1)
      refChild = elementNode.firstChild()
      
    begin
      success = false;
      begin
        insertedNode = elementNode.insertBefore(newChild, refChild)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::WRONG_DOCUMENT_ERR)
      end 
      assert(success, "throw_WRONG_DOCUMENT_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodeinsertbeforenewchilddiffdocument"
  end
end

