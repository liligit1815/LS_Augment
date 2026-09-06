.class final Lretrofit2/ServiceMethod;
.super Ljava/lang/Object;
.source "ServiceMethod.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lretrofit2/ServiceMethod$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final PARAM:Ljava/lang/String; = "[a-zA-Z][a-zA-Z0-9_-]*"

.field static final PARAM_NAME_REGEX:Ljava/util/regex/Pattern;

.field static final PARAM_URL_REGEX:Ljava/util/regex/Pattern;


# instance fields
.field private final baseUrl:LO4/x;

.field final callAdapter:Lretrofit2/CallAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lretrofit2/CallAdapter<",
            "*>;"
        }
    .end annotation
.end field

.field final callFactory:LO4/e$a;

.field private final contentType:LO4/z;

.field private final hasBody:Z

.field private final headers:LO4/w;

.field private final httpMethod:Ljava/lang/String;

.field private final isFormEncoded:Z

.field private final isMultipart:Z

.field private final parameterHandlers:[Lretrofit2/ParameterHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lretrofit2/ParameterHandler<",
            "*>;"
        }
    .end annotation
.end field

.field private final relativeUrl:Ljava/lang/String;

.field private final responseConverter:Lretrofit2/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lretrofit2/Converter<",
            "LO4/H;",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "\\{([a-zA-Z][a-zA-Z0-9_-]*)\\}"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lretrofit2/ServiceMethod;->PARAM_URL_REGEX:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "[a-zA-Z][a-zA-Z0-9_-]*"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lretrofit2/ServiceMethod;->PARAM_NAME_REGEX:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    return-void
.end method

.method constructor <init>(Lretrofit2/ServiceMethod$Builder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit2/ServiceMethod$Builder<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->retrofit:Lretrofit2/Retrofit;

    .line 5
    .line 6
    invoke-virtual {v0}, Lretrofit2/Retrofit;->callFactory()LO4/e$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lretrofit2/ServiceMethod;->callFactory:LO4/e$a;

    .line 11
    .line 12
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->callAdapter:Lretrofit2/CallAdapter;

    .line 13
    .line 14
    iput-object v0, p0, Lretrofit2/ServiceMethod;->callAdapter:Lretrofit2/CallAdapter;

    .line 15
    .line 16
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->retrofit:Lretrofit2/Retrofit;

    .line 17
    .line 18
    invoke-virtual {v0}, Lretrofit2/Retrofit;->baseUrl()LO4/x;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lretrofit2/ServiceMethod;->baseUrl:LO4/x;

    .line 23
    .line 24
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->responseConverter:Lretrofit2/Converter;

    .line 25
    .line 26
    iput-object v0, p0, Lretrofit2/ServiceMethod;->responseConverter:Lretrofit2/Converter;

    .line 27
    .line 28
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->httpMethod:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lretrofit2/ServiceMethod;->httpMethod:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->relativeUrl:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lretrofit2/ServiceMethod;->relativeUrl:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->headers:LO4/w;

    .line 37
    .line 38
    iput-object v0, p0, Lretrofit2/ServiceMethod;->headers:LO4/w;

    .line 39
    .line 40
    iget-object v0, p1, Lretrofit2/ServiceMethod$Builder;->contentType:LO4/z;

    .line 41
    .line 42
    iput-object v0, p0, Lretrofit2/ServiceMethod;->contentType:LO4/z;

    .line 43
    .line 44
    iget-boolean v0, p1, Lretrofit2/ServiceMethod$Builder;->hasBody:Z

    .line 45
    .line 46
    iput-boolean v0, p0, Lretrofit2/ServiceMethod;->hasBody:Z

    .line 47
    .line 48
    iget-boolean v0, p1, Lretrofit2/ServiceMethod$Builder;->isFormEncoded:Z

    .line 49
    .line 50
    iput-boolean v0, p0, Lretrofit2/ServiceMethod;->isFormEncoded:Z

    .line 51
    .line 52
    iget-boolean v0, p1, Lretrofit2/ServiceMethod$Builder;->isMultipart:Z

    .line 53
    .line 54
    iput-boolean v0, p0, Lretrofit2/ServiceMethod;->isMultipart:Z

    .line 55
    .line 56
    iget-object p1, p1, Lretrofit2/ServiceMethod$Builder;->parameterHandlers:[Lretrofit2/ParameterHandler;

    .line 57
    .line 58
    iput-object p1, p0, Lretrofit2/ServiceMethod;->parameterHandlers:[Lretrofit2/ParameterHandler;

    .line 59
    .line 60
    return-void
.end method

.method static boxIfPrimitive(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    const-class p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 9
    .line 10
    if-ne v0, p0, :cond_1

    .line 11
    .line 12
    const-class p0, Ljava/lang/Byte;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    if-ne v0, p0, :cond_2

    .line 18
    .line 19
    const-class p0, Ljava/lang/Character;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 23
    .line 24
    if-ne v0, p0, :cond_3

    .line 25
    .line 26
    const-class p0, Ljava/lang/Double;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 30
    .line 31
    if-ne v0, p0, :cond_4

    .line 32
    .line 33
    const-class p0, Ljava/lang/Float;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 37
    .line 38
    if-ne v0, p0, :cond_5

    .line 39
    .line 40
    const-class p0, Ljava/lang/Integer;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_5
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 44
    .line 45
    if-ne v0, p0, :cond_6

    .line 46
    .line 47
    const-class p0, Ljava/lang/Long;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_6
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 51
    .line 52
    if-ne v0, p0, :cond_7

    .line 53
    .line 54
    const-class p0, Ljava/lang/Short;

    .line 55
    .line 56
    :cond_7
    return-object p0
.end method

.method static parsePathParameters(Ljava/lang/String;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lretrofit2/ServiceMethod;->PARAM_URL_REGEX:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object v0
.end method


# virtual methods
.method varargs toRequest([Ljava/lang/Object;)LO4/E;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Lretrofit2/RequestBuilder;

    .line 2
    .line 3
    iget-object v1, p0, Lretrofit2/ServiceMethod;->httpMethod:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lretrofit2/ServiceMethod;->baseUrl:LO4/x;

    .line 6
    .line 7
    iget-object v3, p0, Lretrofit2/ServiceMethod;->relativeUrl:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Lretrofit2/ServiceMethod;->headers:LO4/w;

    .line 10
    .line 11
    iget-object v5, p0, Lretrofit2/ServiceMethod;->contentType:LO4/z;

    .line 12
    .line 13
    iget-boolean v6, p0, Lretrofit2/ServiceMethod;->hasBody:Z

    .line 14
    .line 15
    iget-boolean v7, p0, Lretrofit2/ServiceMethod;->isFormEncoded:Z

    .line 16
    .line 17
    iget-boolean v8, p0, Lretrofit2/ServiceMethod;->isMultipart:Z

    .line 18
    .line 19
    invoke-direct/range {v0 .. v8}, Lretrofit2/RequestBuilder;-><init>(Ljava/lang/String;LO4/x;Ljava/lang/String;LO4/w;LO4/z;ZZZ)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lretrofit2/ServiceMethod;->parameterHandlers:[Lretrofit2/ParameterHandler;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    array-length v2, p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v2, v1

    .line 30
    :goto_0
    array-length v3, p0

    .line 31
    if-ne v2, v3, :cond_2

    .line 32
    .line 33
    :goto_1
    if-ge v1, v2, :cond_1

    .line 34
    .line 35
    aget-object v3, p0, v1

    .line 36
    .line 37
    aget-object v4, p1, v1

    .line 38
    .line 39
    invoke-virtual {v3, v0, v4}, Lretrofit2/ParameterHandler;->apply(Lretrofit2/RequestBuilder;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {v0}, Lretrofit2/RequestBuilder;->build()LO4/E;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v1, "Argument count ("

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, ") doesn\'t match expected count ("

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    array-length p0, p0

    .line 71
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p0, ")"

    .line 75
    .line 76
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p1
.end method

.method toResponse(LO4/H;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LO4/H;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lretrofit2/ServiceMethod;->responseConverter:Lretrofit2/Converter;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lretrofit2/Converter;->convert(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
