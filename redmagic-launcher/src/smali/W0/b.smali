.class public final LW0/b;
.super Ljava/lang/Object;
.source "AppPairIconDrawingParams.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LW0/b$a;
    }
.end annotation


# static fields
.field public static final n:LW0/b$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:I

.field private final c:F

.field private final d:F

.field private final e:F

.field private final f:F

.field private final g:F

.field private final h:F

.field private final i:F

.field private final j:F

.field private k:Z

.field private l:I

.field private m:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LW0/b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LW0/b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LW0/b;->n:LW0/b$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 6

    .line 1
    const-string v0, "context"

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
    iput-object p1, p0, LW0/b;->a:Landroid/content/Context;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, LW0/b;->k:Z

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput v0, p0, LW0/b;->m:F

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 23
    .line 24
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x2

    .line 29
    if-ne p2, v0, :cond_0

    .line 30
    .line 31
    iget v1, p1, Lcom/android/launcher3/h0;->X1:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget v1, p1, Lcom/android/launcher3/h0;->B1:I

    .line 35
    .line 36
    :goto_0
    iput v1, p0, LW0/b;->b:I

    .line 37
    .line 38
    int-to-float v2, v1

    .line 39
    const v3, 0x3d2aaaab

    .line 40
    .line 41
    .line 42
    mul-float/2addr v2, v3

    .line 43
    iput v2, p0, LW0/b;->c:F

    .line 44
    .line 45
    int-to-float v2, v1

    .line 46
    const v3, 0x3cfa4fa6

    .line 47
    .line 48
    .line 49
    mul-float/2addr v2, v3

    .line 50
    iput v2, p0, LW0/b;->d:F

    .line 51
    .line 52
    int-to-float v4, v1

    .line 53
    const v5, 0x3f6aaaab

    .line 54
    .line 55
    .line 56
    mul-float/2addr v4, v5

    .line 57
    int-to-float v0, v0

    .line 58
    mul-float/2addr v2, v0

    .line 59
    sub-float/2addr v4, v2

    .line 60
    iput v4, p0, LW0/b;->e:F

    .line 61
    .line 62
    int-to-float v0, v1

    .line 63
    mul-float/2addr v0, v3

    .line 64
    iput v0, p0, LW0/b;->f:F

    .line 65
    .line 66
    int-to-float v0, v1

    .line 67
    const v2, 0x3e3bbbbc

    .line 68
    .line 69
    .line 70
    mul-float/2addr v0, v2

    .line 71
    iput v0, p0, LW0/b;->g:F

    .line 72
    .line 73
    int-to-float v0, v1

    .line 74
    const v2, 0x3d7a4fa6

    .line 75
    .line 76
    .line 77
    mul-float/2addr v0, v2

    .line 78
    iput v0, p0, LW0/b;->h:F

    .line 79
    .line 80
    int-to-float v0, v1

    .line 81
    const v2, 0x3d1c71c8

    .line 82
    .line 83
    .line 84
    mul-float/2addr v0, v2

    .line 85
    iput v0, p0, LW0/b;->i:F

    .line 86
    .line 87
    int-to-float v0, v1

    .line 88
    const v1, 0x3eac16c2

    .line 89
    .line 90
    .line 91
    mul-float/2addr v0, v1

    .line 92
    iput v0, p0, LW0/b;->j:F

    .line 93
    .line 94
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, LW0/b;->p(Lcom/android/launcher3/h0;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p2}, LW0/b;->o(I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public final d()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public final e()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, LW0/b;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->m:F

    .line 2
    .line 3
    return p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public final i()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->j:F

    .line 2
    .line 3
    return p0
.end method

.method public final j()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public final k()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public final l()F
    .locals 0

    .line 1
    iget p0, p0, LW0/b;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LW0/b;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public final n(F)V
    .locals 0

    .line 1
    iput p1, p0, LW0/b;->m:F

    .line 2
    .line 3
    return-void
.end method

.method public final o(I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, LW0/b;->a:Landroid/content/Context;

    .line 5
    .line 6
    const v0, 0x7f040083

    .line 7
    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, LW0/b;->l:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, LW0/b;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object v0, Lcom/android/launcher3/x5;->F0:[I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "obtainStyledAttributes(...)"

    .line 29
    .line 30
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, LW0/b;->l:I

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final p(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->Q0:Z

    .line 7
    .line 8
    iput-boolean p1, p0, LW0/b;->k:Z

    .line 9
    .line 10
    return-void
.end method
