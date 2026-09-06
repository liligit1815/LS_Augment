.class public final Ln0/f;
.super Ljava/lang/Object;
.source "ExtensionsUtil.kt"


# static fields
.field public static final a:Ln0/f;

.field private static final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ln0/f;

    .line 2
    .line 3
    invoke-direct {v0}, Ln0/f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ln0/f;->a:Ln0/f;

    .line 7
    .line 8
    const-class v0, Ln0/f;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/jvm/internal/D;->b(Ljava/lang/Class;)LB4/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, LB4/c;->d()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ln0/f;->b:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Landroidx/window/extensions/WindowExtensionsProvider;->getWindowExtensions()Landroidx/window/extensions/WindowExtensions;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroidx/window/extensions/WindowExtensions;->getVendorApiLevel()I

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

    .line 10
    :catch_0
    sget-object p0, Ln0/d;->a:Ln0/d;

    .line 11
    .line 12
    invoke-virtual {p0}, Ln0/d;->a()Ln0/l;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Ln0/l;->h:Ln0/l;

    .line 17
    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    sget-object p0, Ln0/f;->b:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "Stub Extension"

    .line 23
    .line 24
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_1
    sget-object p0, Ln0/d;->a:Ln0/d;

    .line 29
    .line 30
    invoke-virtual {p0}, Ln0/d;->a()Ln0/l;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object v0, Ln0/l;->h:Ln0/l;

    .line 35
    .line 36
    if-ne p0, v0, :cond_0

    .line 37
    .line 38
    sget-object p0, Ln0/f;->b:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "Embedding extension version not found"

    .line 41
    .line 42
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method
