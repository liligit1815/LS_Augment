.class public final Lo0/G$a;
.super Ljava/lang/Object;
.source "SplitPlaceholderRule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/G;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lo0/a;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Landroid/content/Intent;

.field private c:Ljava/lang/String;

.field private d:I

.field private e:I

.field private f:I

.field private g:Lo0/k;

.field private h:Lo0/k;

.field private i:Lo0/H$d;

.field private j:Z

.field private k:Lo0/B;


# direct methods
.method public constructor <init>(Ljava/util/Set;Landroid/content/Intent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lo0/a;",
            ">;",
            "Landroid/content/Intent;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "filters"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "placeholderIntent"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lo0/G$a;->a:Ljava/util/Set;

    .line 15
    .line 16
    iput-object p2, p0, Lo0/G$a;->b:Landroid/content/Intent;

    .line 17
    .line 18
    const/16 p1, 0x258

    .line 19
    .line 20
    iput p1, p0, Lo0/G$a;->d:I

    .line 21
    .line 22
    iput p1, p0, Lo0/G$a;->e:I

    .line 23
    .line 24
    iput p1, p0, Lo0/G$a;->f:I

    .line 25
    .line 26
    sget-object p1, Lo0/H;->i:Lo0/k;

    .line 27
    .line 28
    iput-object p1, p0, Lo0/G$a;->g:Lo0/k;

    .line 29
    .line 30
    sget-object p1, Lo0/H;->j:Lo0/k;

    .line 31
    .line 32
    iput-object p1, p0, Lo0/G$a;->h:Lo0/k;

    .line 33
    .line 34
    sget-object p1, Lo0/H$d;->e:Lo0/H$d;

    .line 35
    .line 36
    iput-object p1, p0, Lo0/G$a;->i:Lo0/H$d;

    .line 37
    .line 38
    new-instance p1, Lo0/B$a;

    .line 39
    .line 40
    invoke-direct {p1}, Lo0/B$a;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lo0/B$a;->a()Lo0/B;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lo0/G$a;->k:Lo0/B;

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final a()Lo0/G;
    .locals 12

    .line 1
    new-instance v0, Lo0/G;

    .line 2
    .line 3
    iget-object v1, p0, Lo0/G$a;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lo0/G$a;->a:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v3, p0, Lo0/G$a;->b:Landroid/content/Intent;

    .line 8
    .line 9
    iget-boolean v4, p0, Lo0/G$a;->j:Z

    .line 10
    .line 11
    iget-object v5, p0, Lo0/G$a;->i:Lo0/H$d;

    .line 12
    .line 13
    iget v6, p0, Lo0/G$a;->d:I

    .line 14
    .line 15
    iget v7, p0, Lo0/G$a;->e:I

    .line 16
    .line 17
    iget v8, p0, Lo0/G$a;->f:I

    .line 18
    .line 19
    iget-object v9, p0, Lo0/G$a;->g:Lo0/k;

    .line 20
    .line 21
    iget-object v10, p0, Lo0/G$a;->h:Lo0/k;

    .line 22
    .line 23
    iget-object v11, p0, Lo0/G$a;->k:Lo0/B;

    .line 24
    .line 25
    invoke-direct/range {v0 .. v11}, Lo0/G;-><init>(Ljava/lang/String;Ljava/util/Set;Landroid/content/Intent;ZLo0/H$d;IIILo0/k;Lo0/k;Lo0/B;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public final b(Lo0/B;)Lo0/G$a;
    .locals 1

    .line 1
    const-string v0, "defaultSplitAttributes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/G$a;->k:Lo0/B;

    .line 7
    .line 8
    return-object p0
.end method

.method public final c(Lo0/H$d;)Lo0/G$a;
    .locals 1

    .line 1
    const-string v0, "finishPrimaryWithPlaceholder"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/G$a;->i:Lo0/H$d;

    .line 7
    .line 8
    return-object p0
.end method

.method public final d(Lo0/k;)Lo0/G$a;
    .locals 1

    .line 1
    const-string v0, "aspectRatio"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/G$a;->h:Lo0/k;

    .line 7
    .line 8
    return-object p0
.end method

.method public final e(Lo0/k;)Lo0/G$a;
    .locals 1

    .line 1
    const-string v0, "aspectRatio"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/G$a;->g:Lo0/k;

    .line 7
    .line 8
    return-object p0
.end method

.method public final f(I)Lo0/G$a;
    .locals 0

    .line 1
    iput p1, p0, Lo0/G$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(I)Lo0/G$a;
    .locals 0

    .line 1
    iput p1, p0, Lo0/G$a;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(I)Lo0/G$a;
    .locals 0

    .line 1
    iput p1, p0, Lo0/G$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Z)Lo0/G$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lo0/G$a;->j:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Ljava/lang/String;)Lo0/G$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lo0/G$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
