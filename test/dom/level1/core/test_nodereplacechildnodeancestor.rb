
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
#     The "replaceChild(newChild,oldChild)" method raises a 
#     HIERARCHY_REQUEST_ERR DOMException if the node to put
#     in is one of this node's ancestors.
#     
#     Retrieve the second employee and attempt to replace
#     one of its children with an ancestor node(root node).
#     An attempt to make such a replacement should raise the 
#     desired exception.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='HIERARCHY_REQUEST_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-785887307]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-785887307')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='HIERARCHY_REQUEST_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-785887307]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=249]
##
DOMTestCase('nodereplacechildnodeancestor') do

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
  def test_nodereplacechildnodeancestor
    doc = nil
    newChild = nil
    elementList = nil
    employeeNode = nil
    childList = nil
    oldChild = nil
    replacedNode = nil
    doc = load_document("staff", true)
      newChild = doc.documentElement()
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(1)
      childList = employeeNode.childNodes()
      oldChild = childList.item(0)
      
    begin
      success = false;
      begin
        replacedNode = employeeNode.replaceChild(newChild, oldChild)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::HIERARCHY_REQUEST_ERR)
      end 
      assert(success, "throw_HIERARCHY_REQUEST_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodereplacechildnodeancestor"
  end
end

