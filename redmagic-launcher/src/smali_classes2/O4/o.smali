.class public interface abstract LO4/o;
.super Ljava/lang/Object;
.source "CookieJar.java"


# static fields
.field public static final a:LO4/o;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LO4/o$a;

    .line 2
    .line 3
    invoke-direct {v0}, LO4/o$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LO4/o;->a:LO4/o;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a(LO4/x;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LO4/x;",
            "Ljava/util/List<",
            "LO4/n;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract b(LO4/x;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LO4/x;",
            ")",
            "Ljava/util/List<",
            "LO4/n;",
            ">;"
        }
    .end annotation
.end method
