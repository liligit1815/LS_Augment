.class public LG/g$a;
.super Ljava/lang/Object;
.source "FontsContractCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LG/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:I

.field private final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[",
            "LG/g$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "[",
            "LG/g$b;",
            ">;)V"
        }
    .end annotation

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput p1, p0, LG/g$a;->a:I

    .line 6
    iput-object p2, p0, LG/g$a;->b:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(I[LG/g$b;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LG/g$a;->a:I

    .line 3
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, LG/g$a;->b:Ljava/util/List;

    return-void
.end method

.method static a(ILjava/util/List;)LG/g$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "[",
            "LG/g$b;",
            ">;)",
            "LG/g$a;"
        }
    .end annotation

    .line 1
    new-instance v0, LG/g$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LG/g$a;-><init>(ILjava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method static b(I[LG/g$b;)LG/g$a;
    .locals 1

    .line 1
    new-instance v0, LG/g$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LG/g$a;-><init>(I[LG/g$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public c()[LG/g$b;
    .locals 1

    .line 1
    iget-object p0, p0, LG/g$a;->b:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, [LG/g$b;

    .line 9
    .line 10
    return-object p0
.end method

.method public d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[",
            "LG/g$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LG/g$a;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, LG/g$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method f()Z
    .locals 1

    .line 1
    iget-object p0, p0, LG/g$a;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-le p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
