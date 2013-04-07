﻿<%@ Page Title="ProjectList" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="ProjList.aspx.cs" Inherits="_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="SidMsg" CssClass="form lable" runat="server">Enter Project ID: </asp:Label>
    <asp:TextBox ID="SidTxt" OnTextChanged="getProjById" runat="server"></asp:TextBox>
    <asp:Button ID="search" class="button"  Visible="true" Text="Search" runat="server" onclick="getProjById" />
    <asp:RegularExpressionValidator ID="checkuname" runat="server" ErrorMessage="Incorrect, must be between 1-10 bits letters or numbers ." ControlToValidate="SidTxt" ValidationExpression="[a-zA-Z0-9]{1,10}" />

   <asp:Panel ID="PnlTable" runat="server">
       <asp:GridView ID="ProjListGrid" runat="server"
           AllowSorting="True" AutoGenerateColumns="False" ShowFooter="True" PageSize="20"
           AllowPaging="True" OnPageIndexChanging="PageIndexChanging" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" DataKeyNames="PID"
            OnRowCancelingEdit="ProjListGrid_RowCancelingEdit" OnRowDeleting="ProjListGrid_RowDeleting" OnRowUpdating="ProjListGrid_RowUpdating" OnRowEditing="ProjListGrid_RowEditing">
            <PagerTemplate>
                <table align="right" bgcolor="#e9e9e9" width="100%">
                    <tr>
                        <td style="text-align: right">
                            Page <b><asp:Label ID="lblPageIndex" runat="server" Text="<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>"></asp:Label></b>
                            of <b><asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label></b>
                            <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First"
                                CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                                Text="First  "></asp:LinkButton>
                            <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                                Text="<< Previous  "></asp:LinkButton>
                            <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                                Text="  Next >>"></asp:LinkButton>
                            <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                                Text="  Last"></asp:LinkButton>
                            <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>"
                                Width="20px"></asp:TextBox>
                            <asp:LinkButton ID="btnGo" runat="server" CausesValidation="false" CommandArgument="-1"
                                CommandName="Page" Text="GO"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </PagerTemplate>
           <Columns>

            <asp:templatefield headertext="Project ID">
                <itemtemplate>
                    <asp:label id="pid" runat='server' Text='<%#Eval("pid") %>'/> 
                </itemtemplate>
            </asp:templatefield>

           <asp:templatefield headertext="Project Name" ItemStyle-Width="400"><itemtemplate><%#Eval("PName") %> </itemtemplate>
           <edititemtemplate>
           <asp:textbox id="textbox1" runat='server' text='<%#Eval("PName") %>'></asp:textbox>
           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Category"><itemtemplate><%#Eval("cid") %> </itemtemplate>
           <edititemtemplate>
           <asp:textbox id="textbox2" runat='server' Text='<%#Eval("cid") %>'></asp:textbox>
           </edititemtemplate>
            </asp:templatefield>
                           <asp:templatefield headertext="Student Name"><itemtemplate> <%#Eval("FName") %></itemtemplate> 
            <edititemtemplate>
            <asp:textbox id="textbox3" runat='server' text='<%#Eval("FName") %>'></asp:textbox>
            </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Grade"><itemtemplate><%#Eval("gid") %> </itemtemplate>
           <edititemtemplate>
           <asp:textbox id="textbox4" runat='server' text='<%#Eval("gid") %>'></asp:textbox>
           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Division"><itemtemplate><%#Eval("Division") %> </itemtemplate>
            </asp:templatefield>

            </Columns>
       </asp:GridView>
   </asp:Panel>
</asp:Content>
