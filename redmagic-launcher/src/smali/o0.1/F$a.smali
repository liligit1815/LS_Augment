.class public final Lo0/F$a;
.super Ljava/lang/Object;
.source "SplitPairRule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/F;
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
            "Lo0/E;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:I

.field private f:Lo0/k;

.field private g:Lo0/k;

.field private h:Lo0/H$d;

.field private i:Lo0/H$d;

.field private j:Z

.field private k:Lo0/B;


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lo0/E;",
            ">;)V"
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lo0/F$a;->a:Ljava/util/Set;

    .line 10
    .line 11
    const/16 p1, 0x258

    .line 12
    .line 13
    iput p1, p0, Lo0/F$a;->c:I

    .line 14
    .line 15
    iput p1, p0, Lo0/F$a;->d:I

    .line 16
    .line 17
    iput p1, p0, Lo0/F$a;->e:I

    .line 18
    .line 19
    sget-object p1, Lo0/H;->i:Lo0/k;

    .line 20
    .line 21
    iput-object p1, p0, Lo0/F$a;->f:Lo0/k;

    .line 22
    .line 23
    sget-object p1, Lo0/H;->j:Lo0/k;

    .line 24
    .line 25
    iput-object p1, p0, Lo0/F$a;->g:Lo0/k;

    .line 26
    .line 27
    sget-object p1, Lo0/H$d;->d:Lo0/H$d;

    .line 28
    .line 29
    iput-object p1, p0, Lo0/F$a;->h:Lo0/H$d;

    .line 30
    .line 31
    sget-object p1, Lo0/H$d;->e:Lo0/H$d;

    .line 32
    .line 33
    iput-object p1, p0, Lo0/F$a;->i:Lo0/H$d;

    .line 34
    .line 35
    new-instance p1, Lo0/B$a;

    .line 36
    .line 37
    invoke-direct {p1}, Lo0/B$a;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Lo0/B$a;->a()Lo0/B;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lo0/F$a;->k:Lo0/B;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final a()Lo0/F;
    .locals 12

    .line 1
    new-instance v0, Lo0/F;

    .line 2
    .line 3
    iget-object v1, p0, Lo0/F$a;->a:Ljava/util/Set;

    .line 4
    .line 5
    iget-object v2, p0, Lo0/F$a;->k:Lo0/B;

    .line 6
    .line 7
    iget-object v3, p0, Lo0/F$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Lo0/F$a;->h:Lo0/H$d;

    .line 10
    .line 11
    iget-object v5, p0, Lo0/F$a;->i:Lo0/H$d;

    .line 12
    .line 13
    iget-boolean v6, p0, Lo0/F$a;->j:Z

    .line 14
    .line 15
    iget v7, p0, Lo0/F$a;->c:I

    .line 16
    .line 17
    iget v8, p0, Lo0/F$a;->d:I

    .line 18
    .line 19
    iget v9, p0, Lo0/F$a;->e:I

    .line 20
    .line 21
    iget-object v10, p0, Lo0/F$a;->f:Lo0/k;

    .line 22
    .line 23
    iget-object v11, p0, Lo0/F$a;->g:Lo0/k;

    .line 24
    .line 25
    invoke-direct/range {v0 .. v11}, Lo0/F;-><init>(Ljava/util/Set;Lo0/B;Ljava/lang/String;Lo0/H$d;Lo0/H$d;ZIIILo0/k;Lo0/k;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public final b(Z)Lo0/F$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lo0/F$a;->j:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Lo0/B;)Lo0/F$a;
    .locals 1

    .line 1
    const-string v0, "defaultSplitAttributes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/F$a;->k:Lo0/B;

    .line 7
    .line 8
    return-object p0
.end method

.method public final d(Lo0/H$d;)Lo0/F$a;
    .locals 1

    .line 1
    const-string v0, "finishPrimaryWithSecondary"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/F$a;->h:Lo0/H$d;

    .line 7
    .line 8
    return-object p0
.end method

.method public final e(Lo0/H$d;)Lo0/F$a;
    .locals 1

    .line 1
    const-string v0, "finishSecondaryWithPrimary"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/F$a;->i:Lo0/H$d;

    .line 7
    .line 8
    return-object p0
.end method

.method public final f(Lo0/k;)Lo0/F$a;
    .locals 1

    .line 1
    const-string v0, "aspectRatio"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/F$a;->g:Lo0/k;

    .line 7
    .line 8
    return-object p0
.end method

.method public final g(Lo0/k;)Lo0/F$a;
    .locals 1

    .line 1
    const-string v0, "aspectRatio"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/F$a;->f:Lo0/k;

    .line 7
    .line 8
    return-object p0
.end method

.method public final h(I)Lo0/F$a;
    .locals 0

    .line 1
    iput p1, p0, Lo0/F$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(I)Lo0/F$a;
    .locals 0

    .line 1
    iput p1, p0, Lo0/F$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(I)Lo0/F$a;
    .locals 0

    .line 1
    iput p1, p0, Lo0/F$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final k(Ljava/lang/String;)Lo0/F$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lo0/F$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
