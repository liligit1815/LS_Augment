.class public final Lu2/F$i;
.super Ljava/lang/Object;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "i"
.end annotation


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Z


# direct methods
.method public constructor <init>(FFFZZZZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lu2/F$i;->a:F

    .line 3
    iput p2, p0, Lu2/F$i;->b:F

    .line 4
    iput p3, p0, Lu2/F$i;->c:F

    .line 5
    iput-boolean p4, p0, Lu2/F$i;->d:Z

    .line 6
    iput-boolean p5, p0, Lu2/F$i;->e:Z

    .line 7
    iput-boolean p6, p0, Lu2/F$i;->f:Z

    .line 8
    iput-boolean p7, p0, Lu2/F$i;->g:Z

    .line 9
    iput-boolean p8, p0, Lu2/F$i;->h:Z

    .line 10
    iput-boolean p9, p0, Lu2/F$i;->i:Z

    return-void
.end method

.method public synthetic constructor <init>(FFFZZZZZZILkotlin/jvm/internal/j;)V
    .locals 10

    move/from16 v0, p10

    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_0

    const/4 p3, 0x0

    :cond_0
    move v3, p3

    and-int/lit8 p3, v0, 0x8

    const/4 v1, 0x0

    if-eqz p3, :cond_1

    move v4, v1

    goto :goto_0

    :cond_1
    move v4, p4

    :goto_0
    and-int/lit8 p3, v0, 0x10

    if-eqz p3, :cond_2

    move v5, v1

    goto :goto_1

    :cond_2
    move v5, p5

    :goto_1
    and-int/lit8 p3, v0, 0x20

    if-eqz p3, :cond_3

    move v6, v1

    goto :goto_2

    :cond_3
    move/from16 v6, p6

    :goto_2
    and-int/lit8 p3, v0, 0x40

    if-eqz p3, :cond_4

    move v7, v1

    goto :goto_3

    :cond_4
    move/from16 v7, p7

    :goto_3
    and-int/lit16 p3, v0, 0x80

    if-eqz p3, :cond_5

    move v8, v1

    goto :goto_4

    :cond_5
    move/from16 v8, p8

    :goto_4
    and-int/lit16 p3, v0, 0x100

    if-eqz p3, :cond_6

    move v9, v1

    move-object v0, p0

    move v2, p2

    move v1, p1

    goto :goto_5

    :cond_6
    move/from16 v9, p9

    move-object v0, p0

    move v1, p1

    move v2, p2

    .line 11
    :goto_5
    invoke-direct/range {v0 .. v9}, Lu2/F$i;-><init>(FFFZZZZZZ)V

    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$i;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$i;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$i;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$i;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$i;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$i;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$i;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final h()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lu2/F$i;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lu2/F$i;->h:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lu2/F$i;->i:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$i;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$i;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final k(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$i;->a:F

    .line 2
    .line 3
    return-void
.end method

.method public final l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$i;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public final m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$i;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public final n(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$i;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public final o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$i;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public final p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$i;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public final q(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$i;->c:F

    .line 2
    .line 3
    return-void
.end method

.method public final r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$i;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public final s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$i;->f:Z

    .line 2
    .line 3
    return-void
.end method
