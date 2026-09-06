.class public interface abstract LO4/c;
.super Ljava/lang/Object;
.source "Authenticator.java"


# static fields
.field public static final a:LO4/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LO4/b;

    .line 2
    .line 3
    invoke-direct {v0}, LO4/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LO4/c;->a:LO4/c;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(LO4/I;LO4/G;)LO4/E;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method


# virtual methods
.method public abstract b(LO4/I;LO4/G;)LO4/E;
    .param p1    # LO4/I;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
