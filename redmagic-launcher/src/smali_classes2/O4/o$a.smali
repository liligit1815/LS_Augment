.class LO4/o$a;
.super Ljava/lang/Object;
.source "CookieJar.java"

# interfaces
.implements LO4/o;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO4/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(LO4/x;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LO4/x;",
            "Ljava/util/List<",
            "LO4/n;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public b(LO4/x;)Ljava/util/List;
    .locals 0
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

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
