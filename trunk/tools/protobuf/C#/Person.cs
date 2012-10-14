// Generated by ProtoGen, Version=2.4.1.473, Culture=neutral, PublicKeyToken=55f7125234beb589.  DO NOT EDIT!
#pragma warning disable 1591, 0612
#region Designer generated code

using pb = global::Google.ProtocolBuffers;
using pbc = global::Google.ProtocolBuffers.Collections;
using pbd = global::Google.ProtocolBuffers.Descriptors;
using scg = global::System.Collections.Generic;
namespace Proto {
  
  [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
  [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
  [global::System.CodeDom.Compiler.GeneratedCodeAttribute("ProtoGen", "2.4.1.473")]
  public static partial class Person {
  
    #region Extension registration
    public static void RegisterAllExtensions(pb::ExtensionRegistry registry) {
    }
    #endregion
    #region Static variables
    internal static pbd::MessageDescriptor internal__static_Person__Descriptor;
    internal static pb::FieldAccess.FieldAccessorTable<global::Person, global::Person.Builder> internal__static_Person__FieldAccessorTable;
    #endregion
    #region Descriptor
    public static pbd::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbd::FileDescriptor descriptor;
    
    static Person() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          "ChNwcm90b3MvUGVyc29uLnByb3RvIjEKBlBlcnNvbhIKCgJpZBgBIAIoBRIM" + 
          "CgRuYW1lGAIgAigJEg0KBWVtYWlsGAMgASgJ");
      pbd::FileDescriptor.InternalDescriptorAssigner assigner = delegate(pbd::FileDescriptor root) {
        descriptor = root;
        internal__static_Person__Descriptor = Descriptor.MessageTypes[0];
        internal__static_Person__FieldAccessorTable = 
            new pb::FieldAccess.FieldAccessorTable<global::Person, global::Person.Builder>(internal__static_Person__Descriptor,
                new string[] { "Id", "Name", "Email", });
        return null;
      };
      pbd::FileDescriptor.InternalBuildGeneratedFileFrom(descriptorData,
          new pbd::FileDescriptor[] {
          }, assigner);
    }
    #endregion
    
  }
}
#region Messages
[global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
[global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
[global::System.CodeDom.Compiler.GeneratedCodeAttribute("ProtoGen", "2.4.1.473")]
public sealed partial class Person : pb::GeneratedMessage<Person, Person.Builder> {
  private Person() { }
  private static readonly Person defaultInstance = new Person().MakeReadOnly();
  private static readonly string[] _personFieldNames = new string[] { "email", "id", "name" };
  private static readonly uint[] _personFieldTags = new uint[] { 26, 8, 18 };
  public static Person DefaultInstance {
    get { return defaultInstance; }
  }
  
  public override Person DefaultInstanceForType {
    get { return DefaultInstance; }
  }
  
  protected override Person ThisMessage {
    get { return this; }
  }
  
  public static pbd::MessageDescriptor Descriptor {
    get { return global::Proto.Person.internal__static_Person__Descriptor; }
  }
  
  protected override pb::FieldAccess.FieldAccessorTable<Person, Person.Builder> InternalFieldAccessors {
    get { return global::Proto.Person.internal__static_Person__FieldAccessorTable; }
  }
  
  public const int IdFieldNumber = 1;
  private bool hasId;
  private int id_;
  public bool HasId {
    get { return hasId; }
  }
  public int Id {
    get { return id_; }
  }
  
  public const int NameFieldNumber = 2;
  private bool hasName;
  private string name_ = "";
  public bool HasName {
    get { return hasName; }
  }
  public string Name {
    get { return name_; }
  }
  
  public const int EmailFieldNumber = 3;
  private bool hasEmail;
  private string email_ = "";
  public bool HasEmail {
    get { return hasEmail; }
  }
  public string Email {
    get { return email_; }
  }
  
  public override bool IsInitialized {
    get {
      if (!hasId) return false;
      if (!hasName) return false;
      return true;
    }
  }
  
  public override void WriteTo(pb::ICodedOutputStream output) {
    int size = SerializedSize;
    string[] field_names = _personFieldNames;
    if (hasId) {
      output.WriteInt32(1, field_names[1], Id);
    }
    if (hasName) {
      output.WriteString(2, field_names[2], Name);
    }
    if (hasEmail) {
      output.WriteString(3, field_names[0], Email);
    }
    UnknownFields.WriteTo(output);
  }
  
  private int memoizedSerializedSize = -1;
  public override int SerializedSize {
    get {
      int size = memoizedSerializedSize;
      if (size != -1) return size;
      
      size = 0;
      if (hasId) {
        size += pb::CodedOutputStream.ComputeInt32Size(1, Id);
      }
      if (hasName) {
        size += pb::CodedOutputStream.ComputeStringSize(2, Name);
      }
      if (hasEmail) {
        size += pb::CodedOutputStream.ComputeStringSize(3, Email);
      }
      size += UnknownFields.SerializedSize;
      memoizedSerializedSize = size;
      return size;
    }
  }
  
  public static Person ParseFrom(pb::ByteString data) {
    return ((Builder) CreateBuilder().MergeFrom(data)).BuildParsed();
  }
  public static Person ParseFrom(pb::ByteString data, pb::ExtensionRegistry extensionRegistry) {
    return ((Builder) CreateBuilder().MergeFrom(data, extensionRegistry)).BuildParsed();
  }
  public static Person ParseFrom(byte[] data) {
    return ((Builder) CreateBuilder().MergeFrom(data)).BuildParsed();
  }
  public static Person ParseFrom(byte[] data, pb::ExtensionRegistry extensionRegistry) {
    return ((Builder) CreateBuilder().MergeFrom(data, extensionRegistry)).BuildParsed();
  }
  public static Person ParseFrom(global::System.IO.Stream input) {
    return ((Builder) CreateBuilder().MergeFrom(input)).BuildParsed();
  }
  public static Person ParseFrom(global::System.IO.Stream input, pb::ExtensionRegistry extensionRegistry) {
    return ((Builder) CreateBuilder().MergeFrom(input, extensionRegistry)).BuildParsed();
  }
  public static Person ParseDelimitedFrom(global::System.IO.Stream input) {
    return CreateBuilder().MergeDelimitedFrom(input).BuildParsed();
  }
  public static Person ParseDelimitedFrom(global::System.IO.Stream input, pb::ExtensionRegistry extensionRegistry) {
    return CreateBuilder().MergeDelimitedFrom(input, extensionRegistry).BuildParsed();
  }
  public static Person ParseFrom(pb::ICodedInputStream input) {
    return ((Builder) CreateBuilder().MergeFrom(input)).BuildParsed();
  }
  public static Person ParseFrom(pb::ICodedInputStream input, pb::ExtensionRegistry extensionRegistry) {
    return ((Builder) CreateBuilder().MergeFrom(input, extensionRegistry)).BuildParsed();
  }
  private Person MakeReadOnly() {
    return this;
  }
  
  public static Builder CreateBuilder() { return new Builder(); }
  public override Builder ToBuilder() { return CreateBuilder(this); }
  public override Builder CreateBuilderForType() { return new Builder(); }
  public static Builder CreateBuilder(Person prototype) {
    return new Builder(prototype);
  }
  
  [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
  [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
  [global::System.CodeDom.Compiler.GeneratedCodeAttribute("ProtoGen", "2.4.1.473")]
  public sealed partial class Builder : pb::GeneratedBuilder<Person, Builder> {
    protected override Builder ThisBuilder {
      get { return this; }
    }
    public Builder() {
      result = DefaultInstance;
      resultIsReadOnly = true;
    }
    internal Builder(Person cloneFrom) {
      result = cloneFrom;
      resultIsReadOnly = true;
    }
    
    private bool resultIsReadOnly;
    private Person result;
    
    private Person PrepareBuilder() {
      if (resultIsReadOnly) {
        Person original = result;
        result = new Person();
        resultIsReadOnly = false;
        MergeFrom(original);
      }
      return result;
    }
    
    public override bool IsInitialized {
      get { return result.IsInitialized; }
    }
    
    protected override Person MessageBeingBuilt {
      get { return PrepareBuilder(); }
    }
    
    public override Builder Clear() {
      result = DefaultInstance;
      resultIsReadOnly = true;
      return this;
    }
    
    public override Builder Clone() {
      if (resultIsReadOnly) {
        return new Builder(result);
      } else {
        return new Builder().MergeFrom(result);
      }
    }
    
    public override pbd::MessageDescriptor DescriptorForType {
      get { return global::Person.Descriptor; }
    }
    
    public override Person DefaultInstanceForType {
      get { return global::Person.DefaultInstance; }
    }
    
    public override Person BuildPartial() {
      if (resultIsReadOnly) {
        return result;
      }
      resultIsReadOnly = true;
      return result.MakeReadOnly();
    }
    
    public override Builder MergeFrom(pb::IMessage other) {
      if (other is Person) {
        return MergeFrom((Person) other);
      } else {
        base.MergeFrom(other);
        return this;
      }
    }
    
    public override Builder MergeFrom(Person other) {
      if (other == global::Person.DefaultInstance) return this;
      PrepareBuilder();
      if (other.HasId) {
        Id = other.Id;
      }
      if (other.HasName) {
        Name = other.Name;
      }
      if (other.HasEmail) {
        Email = other.Email;
      }
      this.MergeUnknownFields(other.UnknownFields);
      return this;
    }
    
    public override Builder MergeFrom(pb::ICodedInputStream input) {
      return MergeFrom(input, pb::ExtensionRegistry.Empty);
    }
    
    public override Builder MergeFrom(pb::ICodedInputStream input, pb::ExtensionRegistry extensionRegistry) {
      PrepareBuilder();
      pb::UnknownFieldSet.Builder unknownFields = null;
      uint tag;
      string field_name;
      while (input.ReadTag(out tag, out field_name)) {
        if(tag == 0 && field_name != null) {
          int field_ordinal = global::System.Array.BinarySearch(_personFieldNames, field_name, global::System.StringComparer.Ordinal);
          if(field_ordinal >= 0)
            tag = _personFieldTags[field_ordinal];
          else {
            if (unknownFields == null) {
              unknownFields = pb::UnknownFieldSet.CreateBuilder(this.UnknownFields);
            }
            ParseUnknownField(input, unknownFields, extensionRegistry, tag, field_name);
            continue;
          }
        }
        switch (tag) {
          case 0: {
            throw pb::InvalidProtocolBufferException.InvalidTag();
          }
          default: {
            if (pb::WireFormat.IsEndGroupTag(tag)) {
              if (unknownFields != null) {
                this.UnknownFields = unknownFields.Build();
              }
              return this;
            }
            if (unknownFields == null) {
              unknownFields = pb::UnknownFieldSet.CreateBuilder(this.UnknownFields);
            }
            ParseUnknownField(input, unknownFields, extensionRegistry, tag, field_name);
            break;
          }
          case 8: {
            result.hasId = input.ReadInt32(ref result.id_);
            break;
          }
          case 18: {
            result.hasName = input.ReadString(ref result.name_);
            break;
          }
          case 26: {
            result.hasEmail = input.ReadString(ref result.email_);
            break;
          }
        }
      }
      
      if (unknownFields != null) {
        this.UnknownFields = unknownFields.Build();
      }
      return this;
    }
    
    
    public bool HasId {
      get { return result.hasId; }
    }
    public int Id {
      get { return result.Id; }
      set { SetId(value); }
    }
    public Builder SetId(int value) {
      PrepareBuilder();
      result.hasId = true;
      result.id_ = value;
      return this;
    }
    public Builder ClearId() {
      PrepareBuilder();
      result.hasId = false;
      result.id_ = 0;
      return this;
    }
    
    public bool HasName {
      get { return result.hasName; }
    }
    public string Name {
      get { return result.Name; }
      set { SetName(value); }
    }
    public Builder SetName(string value) {
      pb::ThrowHelper.ThrowIfNull(value, "value");
      PrepareBuilder();
      result.hasName = true;
      result.name_ = value;
      return this;
    }
    public Builder ClearName() {
      PrepareBuilder();
      result.hasName = false;
      result.name_ = "";
      return this;
    }
    
    public bool HasEmail {
      get { return result.hasEmail; }
    }
    public string Email {
      get { return result.Email; }
      set { SetEmail(value); }
    }
    public Builder SetEmail(string value) {
      pb::ThrowHelper.ThrowIfNull(value, "value");
      PrepareBuilder();
      result.hasEmail = true;
      result.email_ = value;
      return this;
    }
    public Builder ClearEmail() {
      PrepareBuilder();
      result.hasEmail = false;
      result.email_ = "";
      return this;
    }
  }
  static Person() {
    object.ReferenceEquals(global::Proto.Person.Descriptor, null);
  }
}

#endregion


#endregion Designer generated code
