.class public final Lcom/google/android/material/internal/a;
.super Ljava/lang/Object;
.source "CollapsingTextHelper.java"


# static fields
.field private static final t0:Z

.field private static final u0:Landroid/graphics/Paint;


# instance fields
.field private A:Landroid/graphics/Typeface;

.field private B:Landroid/graphics/Typeface;

.field private C:Landroid/graphics/Typeface;

.field private D:Ln3/a;

.field private E:Ln3/a;

.field private F:Landroid/text/TextUtils$TruncateAt;

.field private G:Ljava/lang/CharSequence;

.field private H:Ljava/lang/CharSequence;

.field private I:Z

.field private J:Z

.field private K:Z

.field private L:Landroid/graphics/Bitmap;

.field private M:Landroid/graphics/Paint;

.field private N:F

.field private O:F

.field private P:F

.field private Q:F

.field private R:F

.field private S:I

.field private T:[I

.field private U:Z

.field private final V:Landroid/text/TextPaint;

.field private final W:Landroid/text/TextPaint;

.field private X:Landroid/animation/TimeInterpolator;

.field private Y:Landroid/animation/TimeInterpolator;

.field private Z:F

.field private final a:Landroid/view/View;

.field private a0:F

.field private b:F

.field private b0:F

.field private c:Z

.field private c0:Landroid/content/res/ColorStateList;

.field private d:F

.field private d0:F

.field private e:F

.field private e0:F

.field private f:I

.field private f0:F

.field private final g:Landroid/graphics/Rect;

.field private g0:Landroid/content/res/ColorStateList;

.field private final h:Landroid/graphics/Rect;

.field private h0:F

.field private final i:Landroid/graphics/RectF;

.field private i0:F

.field private j:I

.field private j0:F

.field private k:I

.field private k0:Landroid/text/StaticLayout;

.field private l:F

.field private l0:F

.field private m:F

.field private m0:F

.field private n:Landroid/content/res/ColorStateList;

.field private n0:F

.field private o:Landroid/content/res/ColorStateList;

.field private o0:Ljava/lang/CharSequence;

.field private p:I

.field private p0:I

.field private q:F

.field private q0:F

.field private r:F

.field private r0:F

.field private s:F

.field private s0:I

.field private t:F

.field private u:F

.field private v:F

.field private w:Landroid/graphics/Typeface;

.field private x:Landroid/graphics/Typeface;

.field private y:Landroid/graphics/Typeface;

.field private z:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/google/android/material/internal/a;->t0:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    sput-object v0, Lcom/google/android/material/internal/a;->u0:Landroid/graphics/Paint;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    iput v0, p0, Lcom/google/android/material/internal/a;->j:I

    .line 7
    .line 8
    iput v0, p0, Lcom/google/android/material/internal/a;->k:I

    .line 9
    .line 10
    const/high16 v0, 0x41700000    # 15.0f

    .line 11
    .line 12
    iput v0, p0, Lcom/google/android/material/internal/a;->l:F

    .line 13
    .line 14
    iput v0, p0, Lcom/google/android/material/internal/a;->m:F

    .line 15
    .line 16
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/google/android/material/internal/a;->F:Landroid/text/TextUtils$TruncateAt;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/google/android/material/internal/a;->J:Z

    .line 22
    .line 23
    iput v0, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/google/android/material/internal/a;->q0:F

    .line 27
    .line 28
    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    iput v0, p0, Lcom/google/android/material/internal/a;->r0:F

    .line 31
    .line 32
    sget v0, Lcom/google/android/material/internal/l;->n:I

    .line 33
    .line 34
    iput v0, p0, Lcom/google/android/material/internal/a;->s0:I

    .line 35
    .line 36
    iput-object p1, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 37
    .line 38
    new-instance v0, Landroid/text/TextPaint;

    .line 39
    .line 40
    const/16 v1, 0x81

    .line 41
    .line 42
    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 46
    .line 47
    new-instance v1, Landroid/text/TextPaint;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 53
    .line 54
    new-instance v0, Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 60
    .line 61
    new-instance v0, Landroid/graphics/Rect;

    .line 62
    .line 63
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 67
    .line 68
    new-instance v0, Landroid/graphics/RectF;

    .line 69
    .line 70
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->e()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, Lcom/google/android/material/internal/a;->e:F

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Lcom/google/android/material/internal/a;->Y(Landroid/content/res/Configuration;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private C0(F)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->h(F)V

    .line 2
    .line 3
    .line 4
    sget-boolean p1, Lcom/google/android/material/internal/a;->t0:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget p1, p0, Lcom/google/android/material/internal/a;->N:F

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    cmpl-float p1, p1, v0

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    iput-boolean p1, p0, Lcom/google/android/material/internal/a;->K:Z

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->n()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private M()Landroid/text/Layout$Alignment;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->j:I

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 4
    .line 5
    invoke-static {v0, v1}, LJ/h;->b(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    and-int/lit8 v0, v0, 0x7

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_3

    .line 13
    .line 14
    const/4 v1, 0x5

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    iget-boolean p0, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    sget-object p0, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 38
    .line 39
    return-object p0
.end method

.method private O0()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-le v0, v1, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :cond_0
    iget-boolean p0, p0, Lcom/google/android/material/internal/a;->K:Z

    .line 15
    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    return v1

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private P(Landroid/text/TextPaint;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->m:F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/material/internal/a;->w:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lcom/google/android/material/internal/a;->h0:F

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private Q(Landroid/text/TextPaint;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->l:F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/material/internal/a;->z:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lcom/google/android/material/internal/a;->i0:F

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private S(F)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget v1, p0, Lcom/google/android/material/internal/a;->e:F

    .line 8
    .line 9
    cmpg-float p1, p1, v1

    .line 10
    .line 11
    if-gez p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    iget-object v2, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 30
    .line 31
    iget v2, v2, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    int-to-float v2, v2

    .line 34
    iget-object v3, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 35
    .line 36
    invoke-static {v1, v2, p1, v3}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 41
    .line 42
    iget-object v0, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 43
    .line 44
    iget v1, p0, Lcom/google/android/material/internal/a;->q:F

    .line 45
    .line 46
    iget v2, p0, Lcom/google/android/material/internal/a;->r:F

    .line 47
    .line 48
    iget-object v3, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 49
    .line 50
    invoke-static {v1, v2, p1, v3}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 55
    .line 56
    iget-object v0, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 59
    .line 60
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 61
    .line 62
    int-to-float v1, v1

    .line 63
    iget-object v2, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 64
    .line 65
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 66
    .line 67
    int-to-float v2, v2

    .line 68
    iget-object v3, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 69
    .line 70
    invoke-static {v1, v2, p1, v3}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 75
    .line 76
    iget-object v0, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 79
    .line 80
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    int-to-float v1, v1

    .line 83
    iget-object v2, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 84
    .line 85
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 86
    .line 87
    int-to-float v2, v2

    .line 88
    iget-object p0, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 89
    .line 90
    invoke-static {v1, v2, p1, p0}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 95
    .line 96
    return-void
.end method

.method private static T(FF)Z
    .locals 0

    .line 1
    sub-float/2addr p0, p1

    .line 2
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    const p1, 0x3727c5ac    # 1.0E-5f

    .line 7
    .line 8
    .line 9
    cmpg-float p0, p0, p1

    .line 10
    .line 11
    if-gez p0, :cond_0

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

.method private U()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private W(Ljava/lang/CharSequence;Z)Z
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object p0, LH/e;->d:LH/d;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object p0, LH/e;->c:LH/d;

    .line 7
    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p0, p1, v0, p2}, LH/d;->isRtl(Ljava/lang/CharSequence;II)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private static X(FFFLandroid/animation/TimeInterpolator;)F
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-interface {p3, p2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    :cond_0
    invoke-static {p0, p1, p2}, LY2/a;->a(FFF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private Z(Landroid/text/TextPaint;Ljava/lang/CharSequence;)F
    .locals 1

    .line 1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p2, v0, p0}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private static a(IIF)I
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr v0, p2

    .line 4
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    int-to-float v1, v1

    .line 9
    mul-float/2addr v1, v0

    .line 10
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    int-to-float v2, v2

    .line 15
    mul-float/2addr v2, p2

    .line 16
    add-float/2addr v1, v2

    .line 17
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    mul-float/2addr v2, v0

    .line 23
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    int-to-float v3, v3

    .line 28
    mul-float/2addr v3, p2

    .line 29
    add-float/2addr v2, v3

    .line 30
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-float v3, v3

    .line 35
    mul-float/2addr v3, v0

    .line 36
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    int-to-float v4, v4

    .line 41
    mul-float/2addr v4, p2

    .line 42
    add-float/2addr v3, v4

    .line 43
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    int-to-float p0, p0

    .line 48
    mul-float/2addr p0, v0

    .line 49
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    int-to-float p1, p1

    .line 54
    mul-float/2addr p1, p2

    .line 55
    add-float/2addr p0, p1

    .line 56
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-static {p1, p2, v0, p0}, Landroid/graphics/Color;->argb(IIII)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method

.method private b(Z)V
    .locals 9

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/google/android/material/internal/a;->i(FZ)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/text/StaticLayout;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    iget-object v3, p0, Lcom/google/android/material/internal/a;->F:Landroid/text/TextUtils$TruncateAt;

    .line 22
    .line 23
    invoke-static {v0, v2, v1, v3}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/google/android/material/internal/a;->o0:Ljava/lang/CharSequence;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/internal/a;->o0:Ljava/lang/CharSequence;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 35
    .line 36
    invoke-direct {p0, v2, v0}, Lcom/google/android/material/internal/a;->Z(Landroid/text/TextPaint;Ljava/lang/CharSequence;)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iput v1, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 44
    .line 45
    :goto_0
    iget v0, p0, Lcom/google/android/material/internal/a;->k:I

    .line 46
    .line 47
    iget-boolean v2, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 48
    .line 49
    invoke-static {v0, v2}, LJ/h;->b(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    and-int/lit8 v2, v0, 0x70

    .line 54
    .line 55
    const/16 v3, 0x50

    .line 56
    .line 57
    const/16 v4, 0x30

    .line 58
    .line 59
    const/high16 v5, 0x40000000    # 2.0f

    .line 60
    .line 61
    if-eq v2, v4, :cond_3

    .line 62
    .line 63
    if-eq v2, v3, :cond_2

    .line 64
    .line 65
    iget-object v2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/text/TextPaint;->descent()F

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iget-object v6, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 72
    .line 73
    invoke-virtual {v6}, Landroid/text/TextPaint;->ascent()F

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    sub-float/2addr v2, v6

    .line 78
    div-float/2addr v2, v5

    .line 79
    iget-object v6, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 80
    .line 81
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    int-to-float v6, v6

    .line 86
    sub-float/2addr v6, v2

    .line 87
    iput v6, p0, Lcom/google/android/material/internal/a;->r:F

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    iget-object v2, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 91
    .line 92
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 93
    .line 94
    int-to-float v2, v2

    .line 95
    iget-object v6, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 96
    .line 97
    invoke-virtual {v6}, Landroid/text/TextPaint;->ascent()F

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    add-float/2addr v2, v6

    .line 102
    iput v2, p0, Lcom/google/android/material/internal/a;->r:F

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    iget-object v2, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 106
    .line 107
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 108
    .line 109
    int-to-float v2, v2

    .line 110
    iput v2, p0, Lcom/google/android/material/internal/a;->r:F

    .line 111
    .line 112
    :goto_1
    const v2, 0x800007

    .line 113
    .line 114
    .line 115
    and-int/2addr v0, v2

    .line 116
    const/4 v6, 0x5

    .line 117
    const/4 v7, 0x1

    .line 118
    if-eq v0, v7, :cond_5

    .line 119
    .line 120
    if-eq v0, v6, :cond_4

    .line 121
    .line 122
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 123
    .line 124
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 125
    .line 126
    int-to-float v0, v0

    .line 127
    iput v0, p0, Lcom/google/android/material/internal/a;->t:F

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_4
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 131
    .line 132
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 133
    .line 134
    int-to-float v0, v0

    .line 135
    iget v8, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 136
    .line 137
    sub-float/2addr v0, v8

    .line 138
    iput v0, p0, Lcom/google/android/material/internal/a;->t:F

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_5
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 142
    .line 143
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    int-to-float v0, v0

    .line 148
    iget v8, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 149
    .line 150
    div-float/2addr v8, v5

    .line 151
    sub-float/2addr v0, v8

    .line 152
    iput v0, p0, Lcom/google/android/material/internal/a;->t:F

    .line 153
    .line 154
    :goto_2
    invoke-direct {p0, v1, p1}, Lcom/google/android/material/internal/a;->i(FZ)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 158
    .line 159
    if-eqz p1, :cond_6

    .line 160
    .line 161
    invoke-virtual {p1}, Landroid/text/StaticLayout;->getHeight()I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    int-to-float p1, p1

    .line 166
    goto :goto_3

    .line 167
    :cond_6
    move p1, v1

    .line 168
    :goto_3
    iget-object v0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 169
    .line 170
    if-eqz v0, :cond_7

    .line 171
    .line 172
    iget v8, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 173
    .line 174
    if-le v8, v7, :cond_7

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getWidth()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    int-to-float v1, v0

    .line 181
    goto :goto_4

    .line 182
    :cond_7
    iget-object v0, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 183
    .line 184
    if-eqz v0, :cond_8

    .line 185
    .line 186
    iget-object v1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 187
    .line 188
    invoke-direct {p0, v1, v0}, Lcom/google/android/material/internal/a;->Z(Landroid/text/TextPaint;Ljava/lang/CharSequence;)F

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    :cond_8
    :goto_4
    iget-object v0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 193
    .line 194
    if-eqz v0, :cond_9

    .line 195
    .line 196
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    goto :goto_5

    .line 201
    :cond_9
    const/4 v0, 0x0

    .line 202
    :goto_5
    iput v0, p0, Lcom/google/android/material/internal/a;->p:I

    .line 203
    .line 204
    iget v0, p0, Lcom/google/android/material/internal/a;->j:I

    .line 205
    .line 206
    iget-boolean v8, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 207
    .line 208
    invoke-static {v0, v8}, LJ/h;->b(II)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    and-int/lit8 v8, v0, 0x70

    .line 213
    .line 214
    if-eq v8, v4, :cond_b

    .line 215
    .line 216
    if-eq v8, v3, :cond_a

    .line 217
    .line 218
    div-float/2addr p1, v5

    .line 219
    iget-object v3, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 220
    .line 221
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    int-to-float v3, v3

    .line 226
    sub-float/2addr v3, p1

    .line 227
    iput v3, p0, Lcom/google/android/material/internal/a;->q:F

    .line 228
    .line 229
    goto :goto_6

    .line 230
    :cond_a
    iget-object v3, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 231
    .line 232
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 233
    .line 234
    int-to-float v3, v3

    .line 235
    sub-float/2addr v3, p1

    .line 236
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 237
    .line 238
    invoke-virtual {p1}, Landroid/text/TextPaint;->descent()F

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    add-float/2addr v3, p1

    .line 243
    iput v3, p0, Lcom/google/android/material/internal/a;->q:F

    .line 244
    .line 245
    goto :goto_6

    .line 246
    :cond_b
    iget-object p1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 247
    .line 248
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 249
    .line 250
    int-to-float p1, p1

    .line 251
    iput p1, p0, Lcom/google/android/material/internal/a;->q:F

    .line 252
    .line 253
    :goto_6
    and-int p1, v0, v2

    .line 254
    .line 255
    if-eq p1, v7, :cond_d

    .line 256
    .line 257
    if-eq p1, v6, :cond_c

    .line 258
    .line 259
    iget-object p1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 260
    .line 261
    iget p1, p1, Landroid/graphics/Rect;->left:I

    .line 262
    .line 263
    int-to-float p1, p1

    .line 264
    iput p1, p0, Lcom/google/android/material/internal/a;->s:F

    .line 265
    .line 266
    goto :goto_7

    .line 267
    :cond_c
    iget-object p1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 268
    .line 269
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 270
    .line 271
    int-to-float p1, p1

    .line 272
    sub-float/2addr p1, v1

    .line 273
    iput p1, p0, Lcom/google/android/material/internal/a;->s:F

    .line 274
    .line 275
    goto :goto_7

    .line 276
    :cond_d
    iget-object p1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 277
    .line 278
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    int-to-float p1, p1

    .line 283
    div-float/2addr v1, v5

    .line 284
    sub-float/2addr p1, v1

    .line 285
    iput p1, p0, Lcom/google/android/material/internal/a;->s:F

    .line 286
    .line 287
    :goto_7
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->j()V

    .line 288
    .line 289
    .line 290
    iget p1, p0, Lcom/google/android/material/internal/a;->b:F

    .line 291
    .line 292
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->C0(F)V

    .line 293
    .line 294
    .line 295
    return-void
.end method

.method private c()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->b:F

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->g(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static c0(Landroid/graphics/Rect;IIII)Z
    .locals 1

    .line 1
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget p1, p0, Landroid/graphics/Rect;->top:I

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    iget p1, p0, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    if-ne p1, p3, :cond_0

    .line 12
    .line 13
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    if-ne p0, p4, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private d(F)F
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->e:F

    .line 2
    .line 3
    cmpg-float v1, p1, v0

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/high16 v3, 0x3f800000    # 1.0f

    .line 7
    .line 8
    if-gtz v1, :cond_0

    .line 9
    .line 10
    iget p0, p0, Lcom/google/android/material/internal/a;->d:F

    .line 11
    .line 12
    invoke-static {v3, v2, p0, v0, p1}, LY2/a;->b(FFFFF)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {v2, v3, v0, v3, p1}, LY2/a;->b(FFFFF)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method private e()F
    .locals 2

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->d:F

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    const/high16 v1, 0x3f000000    # 0.5f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    add-float/2addr p0, v0

    .line 10
    return p0
.end method

.method private f(Ljava/lang/CharSequence;)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/google/android/material/internal/a;->J:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/internal/a;->W(Ljava/lang/CharSequence;Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    return v0
.end method

.method private g(F)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->S(F)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/high16 v2, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v0, p0, Lcom/google/android/material/internal/a;->e:F

    .line 12
    .line 13
    cmpg-float v0, p1, v0

    .line 14
    .line 15
    if-gez v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Lcom/google/android/material/internal/a;->s:F

    .line 18
    .line 19
    iput v0, p0, Lcom/google/android/material/internal/a;->u:F

    .line 20
    .line 21
    iget v0, p0, Lcom/google/android/material/internal/a;->q:F

    .line 22
    .line 23
    iput v0, p0, Lcom/google/android/material/internal/a;->v:F

    .line 24
    .line 25
    invoke-direct {p0, v1}, Lcom/google/android/material/internal/a;->C0(F)V

    .line 26
    .line 27
    .line 28
    move v0, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget v0, p0, Lcom/google/android/material/internal/a;->t:F

    .line 31
    .line 32
    iput v0, p0, Lcom/google/android/material/internal/a;->u:F

    .line 33
    .line 34
    iget v0, p0, Lcom/google/android/material/internal/a;->r:F

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    iget v4, p0, Lcom/google/android/material/internal/a;->f:I

    .line 38
    .line 39
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    int-to-float v3, v3

    .line 44
    sub-float/2addr v0, v3

    .line 45
    iput v0, p0, Lcom/google/android/material/internal/a;->v:F

    .line 46
    .line 47
    invoke-direct {p0, v2}, Lcom/google/android/material/internal/a;->C0(F)V

    .line 48
    .line 49
    .line 50
    move v0, v2

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget v0, p0, Lcom/google/android/material/internal/a;->s:F

    .line 53
    .line 54
    iget v3, p0, Lcom/google/android/material/internal/a;->t:F

    .line 55
    .line 56
    iget-object v4, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 57
    .line 58
    invoke-static {v0, v3, p1, v4}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/google/android/material/internal/a;->u:F

    .line 63
    .line 64
    iget v0, p0, Lcom/google/android/material/internal/a;->q:F

    .line 65
    .line 66
    iget v3, p0, Lcom/google/android/material/internal/a;->r:F

    .line 67
    .line 68
    iget-object v4, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 69
    .line 70
    invoke-static {v0, v3, p1, v4}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/google/android/material/internal/a;->v:F

    .line 75
    .line 76
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->C0(F)V

    .line 77
    .line 78
    .line 79
    move v0, p1

    .line 80
    :goto_0
    sub-float v3, v2, p1

    .line 81
    .line 82
    sget-object v4, LY2/a;->b:Landroid/animation/TimeInterpolator;

    .line 83
    .line 84
    invoke-static {v1, v2, v3, v4}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    sub-float v3, v2, v3

    .line 89
    .line 90
    invoke-direct {p0, v3}, Lcom/google/android/material/internal/a;->h0(F)V

    .line 91
    .line 92
    .line 93
    invoke-static {v2, v1, p1, v4}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-direct {p0, v1}, Lcom/google/android/material/internal/a;->s0(F)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 101
    .line 102
    iget-object v2, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 103
    .line 104
    if-eq v1, v2, :cond_2

    .line 105
    .line 106
    iget-object v1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 107
    .line 108
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->y()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->w()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    invoke-static {v2, v3, v0}, Lcom/google/android/material/internal/a;->a(IIF)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    iget-object v0, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->w()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 131
    .line 132
    .line 133
    :goto_1
    iget v0, p0, Lcom/google/android/material/internal/a;->h0:F

    .line 134
    .line 135
    iget v1, p0, Lcom/google/android/material/internal/a;->i0:F

    .line 136
    .line 137
    cmpl-float v2, v0, v1

    .line 138
    .line 139
    if-eqz v2, :cond_3

    .line 140
    .line 141
    iget-object v2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 142
    .line 143
    invoke-static {v1, v0, p1, v4}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    invoke-virtual {v2, v0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_3
    iget-object v1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 152
    .line 153
    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 154
    .line 155
    .line 156
    :goto_2
    iget v0, p0, Lcom/google/android/material/internal/a;->d0:F

    .line 157
    .line 158
    iget v1, p0, Lcom/google/android/material/internal/a;->Z:F

    .line 159
    .line 160
    const/4 v2, 0x0

    .line 161
    invoke-static {v0, v1, p1, v2}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    iput v0, p0, Lcom/google/android/material/internal/a;->P:F

    .line 166
    .line 167
    iget v0, p0, Lcom/google/android/material/internal/a;->e0:F

    .line 168
    .line 169
    iget v1, p0, Lcom/google/android/material/internal/a;->a0:F

    .line 170
    .line 171
    invoke-static {v0, v1, p1, v2}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    iput v0, p0, Lcom/google/android/material/internal/a;->Q:F

    .line 176
    .line 177
    iget v0, p0, Lcom/google/android/material/internal/a;->f0:F

    .line 178
    .line 179
    iget v1, p0, Lcom/google/android/material/internal/a;->b0:F

    .line 180
    .line 181
    invoke-static {v0, v1, p1, v2}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    iput v0, p0, Lcom/google/android/material/internal/a;->R:F

    .line 186
    .line 187
    iget-object v0, p0, Lcom/google/android/material/internal/a;->g0:Landroid/content/res/ColorStateList;

    .line 188
    .line 189
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->x(Landroid/content/res/ColorStateList;)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    iget-object v1, p0, Lcom/google/android/material/internal/a;->c0:Landroid/content/res/ColorStateList;

    .line 194
    .line 195
    invoke-direct {p0, v1}, Lcom/google/android/material/internal/a;->x(Landroid/content/res/ColorStateList;)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    invoke-static {v0, v1, p1}, Lcom/google/android/material/internal/a;->a(IIF)I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    iput v0, p0, Lcom/google/android/material/internal/a;->S:I

    .line 204
    .line 205
    iget-object v1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 206
    .line 207
    iget v2, p0, Lcom/google/android/material/internal/a;->P:F

    .line 208
    .line 209
    iget v3, p0, Lcom/google/android/material/internal/a;->Q:F

    .line 210
    .line 211
    iget v4, p0, Lcom/google/android/material/internal/a;->R:F

    .line 212
    .line 213
    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 214
    .line 215
    .line 216
    iget-boolean v0, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 217
    .line 218
    if-eqz v0, :cond_4

    .line 219
    .line 220
    iget-object v0, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 221
    .line 222
    invoke-virtual {v0}, Landroid/text/TextPaint;->getAlpha()I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->d(F)F

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    int-to-float v0, v0

    .line 231
    mul-float/2addr p1, v0

    .line 232
    float-to-int p1, p1

    .line 233
    iget-object v0, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 234
    .line 235
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 239
    .line 240
    iget v0, p0, Lcom/google/android/material/internal/a;->P:F

    .line 241
    .line 242
    iget v1, p0, Lcom/google/android/material/internal/a;->Q:F

    .line 243
    .line 244
    iget v2, p0, Lcom/google/android/material/internal/a;->R:F

    .line 245
    .line 246
    iget v3, p0, Lcom/google/android/material/internal/a;->S:I

    .line 247
    .line 248
    invoke-virtual {p1}, Landroid/text/TextPaint;->getAlpha()I

    .line 249
    .line 250
    .line 251
    move-result v4

    .line 252
    invoke-static {v3, v4}, Lg3/a;->a(II)I

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 257
    .line 258
    .line 259
    :cond_4
    iget-object p0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 260
    .line 261
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 262
    .line 263
    .line 264
    return-void
.end method

.method private h(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/internal/a;->i(FZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private h0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->m0:F

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private i(FZ)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_a

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v0, v0

    .line 14
    iget-object v1, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-static {p1, v2}, Lcom/google/android/material/internal/a;->T(FF)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x0

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    iget p1, p0, Lcom/google/android/material/internal/a;->m:F

    .line 31
    .line 32
    iget p2, p0, Lcom/google/android/material/internal/a;->h0:F

    .line 33
    .line 34
    iput v2, p0, Lcom/google/android/material/internal/a;->N:F

    .line 35
    .line 36
    iget-object v1, p0, Lcom/google/android/material/internal/a;->w:Landroid/graphics/Typeface;

    .line 37
    .line 38
    goto :goto_3

    .line 39
    :cond_1
    iget v3, p0, Lcom/google/android/material/internal/a;->l:F

    .line 40
    .line 41
    iget v5, p0, Lcom/google/android/material/internal/a;->i0:F

    .line 42
    .line 43
    iget-object v6, p0, Lcom/google/android/material/internal/a;->z:Landroid/graphics/Typeface;

    .line 44
    .line 45
    invoke-static {p1, v4}, Lcom/google/android/material/internal/a;->T(FF)Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    if-eqz v7, :cond_2

    .line 50
    .line 51
    iput v2, p0, Lcom/google/android/material/internal/a;->N:F

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget v7, p0, Lcom/google/android/material/internal/a;->l:F

    .line 55
    .line 56
    iget v8, p0, Lcom/google/android/material/internal/a;->m:F

    .line 57
    .line 58
    iget-object v9, p0, Lcom/google/android/material/internal/a;->Y:Landroid/animation/TimeInterpolator;

    .line 59
    .line 60
    invoke-static {v7, v8, p1, v9}, Lcom/google/android/material/internal/a;->X(FFFLandroid/animation/TimeInterpolator;)F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget v7, p0, Lcom/google/android/material/internal/a;->l:F

    .line 65
    .line 66
    div-float/2addr p1, v7

    .line 67
    iput p1, p0, Lcom/google/android/material/internal/a;->N:F

    .line 68
    .line 69
    :goto_0
    iget p1, p0, Lcom/google/android/material/internal/a;->m:F

    .line 70
    .line 71
    iget v7, p0, Lcom/google/android/material/internal/a;->l:F

    .line 72
    .line 73
    div-float/2addr p1, v7

    .line 74
    mul-float v7, v1, p1

    .line 75
    .line 76
    if-nez p2, :cond_4

    .line 77
    .line 78
    iget-boolean p2, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 79
    .line 80
    if-eqz p2, :cond_3

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    cmpl-float p2, v7, v0

    .line 84
    .line 85
    if-lez p2, :cond_4

    .line 86
    .line 87
    div-float/2addr v0, p1

    .line 88
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    move v0, p1

    .line 93
    :goto_1
    move p1, v3

    .line 94
    move p2, v5

    .line 95
    move-object v1, v6

    .line 96
    goto :goto_3

    .line 97
    :cond_4
    :goto_2
    move v0, v1

    .line 98
    goto :goto_1

    .line 99
    :goto_3
    cmpl-float v3, v0, v4

    .line 100
    .line 101
    const/4 v4, 0x1

    .line 102
    const/4 v5, 0x0

    .line 103
    if-lez v3, :cond_c

    .line 104
    .line 105
    iget v3, p0, Lcom/google/android/material/internal/a;->O:F

    .line 106
    .line 107
    cmpl-float v3, v3, p1

    .line 108
    .line 109
    if-eqz v3, :cond_5

    .line 110
    .line 111
    move v3, v4

    .line 112
    goto :goto_4

    .line 113
    :cond_5
    move v3, v5

    .line 114
    :goto_4
    iget v6, p0, Lcom/google/android/material/internal/a;->j0:F

    .line 115
    .line 116
    cmpl-float v6, v6, p2

    .line 117
    .line 118
    if-eqz v6, :cond_6

    .line 119
    .line 120
    move v6, v4

    .line 121
    goto :goto_5

    .line 122
    :cond_6
    move v6, v5

    .line 123
    :goto_5
    iget-object v7, p0, Lcom/google/android/material/internal/a;->C:Landroid/graphics/Typeface;

    .line 124
    .line 125
    if-eq v7, v1, :cond_7

    .line 126
    .line 127
    move v7, v4

    .line 128
    goto :goto_6

    .line 129
    :cond_7
    move v7, v5

    .line 130
    :goto_6
    iget-object v8, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 131
    .line 132
    if-eqz v8, :cond_8

    .line 133
    .line 134
    invoke-virtual {v8}, Landroid/text/StaticLayout;->getWidth()I

    .line 135
    .line 136
    .line 137
    move-result v8

    .line 138
    int-to-float v8, v8

    .line 139
    cmpl-float v8, v0, v8

    .line 140
    .line 141
    if-eqz v8, :cond_8

    .line 142
    .line 143
    move v8, v4

    .line 144
    goto :goto_7

    .line 145
    :cond_8
    move v8, v5

    .line 146
    :goto_7
    if-nez v3, :cond_a

    .line 147
    .line 148
    if-nez v6, :cond_a

    .line 149
    .line 150
    if-nez v8, :cond_a

    .line 151
    .line 152
    if-nez v7, :cond_a

    .line 153
    .line 154
    iget-boolean v3, p0, Lcom/google/android/material/internal/a;->U:Z

    .line 155
    .line 156
    if-eqz v3, :cond_9

    .line 157
    .line 158
    goto :goto_8

    .line 159
    :cond_9
    move v3, v5

    .line 160
    goto :goto_9

    .line 161
    :cond_a
    :goto_8
    move v3, v4

    .line 162
    :goto_9
    iput p1, p0, Lcom/google/android/material/internal/a;->O:F

    .line 163
    .line 164
    iput p2, p0, Lcom/google/android/material/internal/a;->j0:F

    .line 165
    .line 166
    iput-object v1, p0, Lcom/google/android/material/internal/a;->C:Landroid/graphics/Typeface;

    .line 167
    .line 168
    iput-boolean v5, p0, Lcom/google/android/material/internal/a;->U:Z

    .line 169
    .line 170
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 171
    .line 172
    iget p2, p0, Lcom/google/android/material/internal/a;->N:F

    .line 173
    .line 174
    cmpl-float p2, p2, v2

    .line 175
    .line 176
    if-eqz p2, :cond_b

    .line 177
    .line 178
    move v5, v4

    .line 179
    :cond_b
    invoke-virtual {p1, v5}, Landroid/text/TextPaint;->setLinearText(Z)V

    .line 180
    .line 181
    .line 182
    move v5, v3

    .line 183
    :cond_c
    iget-object p1, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 184
    .line 185
    if-eqz p1, :cond_e

    .line 186
    .line 187
    if-eqz v5, :cond_d

    .line 188
    .line 189
    goto :goto_b

    .line 190
    :cond_d
    :goto_a
    return-void

    .line 191
    :cond_e
    :goto_b
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 192
    .line 193
    iget p2, p0, Lcom/google/android/material/internal/a;->O:F

    .line 194
    .line 195
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 199
    .line 200
    iget-object p2, p0, Lcom/google/android/material/internal/a;->C:Landroid/graphics/Typeface;

    .line 201
    .line 202
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 206
    .line 207
    iget p2, p0, Lcom/google/android/material/internal/a;->j0:F

    .line 208
    .line 209
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 213
    .line 214
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->f(Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    iput-boolean p1, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 219
    .line 220
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->O0()Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_f

    .line 225
    .line 226
    iget v4, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 227
    .line 228
    :cond_f
    iget-boolean p1, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 229
    .line 230
    invoke-direct {p0, v4, v0, p1}, Lcom/google/android/material/internal/a;->k(IFZ)Landroid/text/StaticLayout;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    iput-object p1, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 235
    .line 236
    invoke-virtual {p1}, Landroid/text/StaticLayout;->getText()Ljava/lang/CharSequence;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    iput-object p1, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 241
    .line 242
    return-void
.end method

.method private j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private k(IFZ)Landroid/text/StaticLayout;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->M()Landroid/text/Layout$Alignment;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    iget-object v2, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 15
    .line 16
    float-to-int p2, p2

    .line 17
    invoke-static {v2, v3, p2}, Lcom/google/android/material/internal/l;->b(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Lcom/google/android/material/internal/l;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-object v2, p0, Lcom/google/android/material/internal/a;->F:Landroid/text/TextUtils$TruncateAt;

    .line 22
    .line 23
    invoke-virtual {p2, v2}, Lcom/google/android/material/internal/l;->d(Landroid/text/TextUtils$TruncateAt;)Lcom/google/android/material/internal/l;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2, p3}, Lcom/google/android/material/internal/l;->g(Z)Lcom/google/android/material/internal/l;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2, v0}, Lcom/google/android/material/internal/l;->c(Landroid/text/Layout$Alignment;)Lcom/google/android/material/internal/l;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const/4 p3, 0x0

    .line 36
    invoke-virtual {p2, p3}, Lcom/google/android/material/internal/l;->f(Z)Lcom/google/android/material/internal/l;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2, p1}, Lcom/google/android/material/internal/l;->i(I)Lcom/google/android/material/internal/l;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget p2, p0, Lcom/google/android/material/internal/a;->q0:F

    .line 45
    .line 46
    iget p3, p0, Lcom/google/android/material/internal/a;->r0:F

    .line 47
    .line 48
    invoke-virtual {p1, p2, p3}, Lcom/google/android/material/internal/l;->h(FF)Lcom/google/android/material/internal/l;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget p0, p0, Lcom/google/android/material/internal/a;->s0:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/google/android/material/internal/l;->e(I)Lcom/google/android/material/internal/l;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, v1}, Lcom/google/android/material/internal/l;->j(Lcom/google/android/material/internal/m;)Lcom/google/android/material/internal/l;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/google/android/material/internal/l;->a()Landroid/text/StaticLayout;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, LI/h;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Landroid/text/StaticLayout;

    .line 71
    .line 72
    return-object p0
.end method

.method private m(Landroid/graphics/Canvas;FF)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/text/TextPaint;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 8
    .line 9
    .line 10
    iget-boolean p2, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 15
    .line 16
    iget p3, p0, Lcom/google/android/material/internal/a;->n0:F

    .line 17
    .line 18
    int-to-float v1, v0

    .line 19
    mul-float/2addr p3, v1

    .line 20
    float-to-int p3, p3

    .line 21
    invoke-virtual {p2, p3}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 25
    .line 26
    iget p3, p0, Lcom/google/android/material/internal/a;->P:F

    .line 27
    .line 28
    iget v1, p0, Lcom/google/android/material/internal/a;->Q:F

    .line 29
    .line 30
    iget v2, p0, Lcom/google/android/material/internal/a;->R:F

    .line 31
    .line 32
    iget v3, p0, Lcom/google/android/material/internal/a;->S:I

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/text/TextPaint;->getAlpha()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-static {v3, v4}, Lg3/a;->a(II)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {p2, p3, v1, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 46
    .line 47
    invoke-virtual {p2, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-boolean p2, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 51
    .line 52
    if-nez p2, :cond_1

    .line 53
    .line 54
    iget-object p2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 55
    .line 56
    iget p3, p0, Lcom/google/android/material/internal/a;->m0:F

    .line 57
    .line 58
    int-to-float v1, v0

    .line 59
    mul-float/2addr p3, v1

    .line 60
    float-to-int p3, p3

    .line 61
    invoke-virtual {p2, p3}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object p2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 65
    .line 66
    iget p3, p0, Lcom/google/android/material/internal/a;->P:F

    .line 67
    .line 68
    iget v1, p0, Lcom/google/android/material/internal/a;->Q:F

    .line 69
    .line 70
    iget v2, p0, Lcom/google/android/material/internal/a;->R:F

    .line 71
    .line 72
    iget v3, p0, Lcom/google/android/material/internal/a;->S:I

    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/text/TextPaint;->getAlpha()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {v3, v4}, Lg3/a;->a(II)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {p2, p3, v1, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 86
    .line 87
    const/4 p3, 0x0

    .line 88
    invoke-virtual {p2, p3}, Landroid/text/StaticLayout;->getLineBaseline(I)I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    iget-object v2, p0, Lcom/google/android/material/internal/a;->o0:Ljava/lang/CharSequence;

    .line 93
    .line 94
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    int-to-float v6, p2

    .line 99
    iget-object v7, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 100
    .line 101
    const/4 v3, 0x0

    .line 102
    const/4 v5, 0x0

    .line 103
    move-object v1, p1

    .line 104
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 108
    .line 109
    iget p2, p0, Lcom/google/android/material/internal/a;->P:F

    .line 110
    .line 111
    iget v2, p0, Lcom/google/android/material/internal/a;->Q:F

    .line 112
    .line 113
    iget v3, p0, Lcom/google/android/material/internal/a;->R:F

    .line 114
    .line 115
    iget v4, p0, Lcom/google/android/material/internal/a;->S:I

    .line 116
    .line 117
    invoke-virtual {p1, p2, v2, v3, v4}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 118
    .line 119
    .line 120
    iget-boolean p1, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 121
    .line 122
    if-nez p1, :cond_3

    .line 123
    .line 124
    iget-object p1, p0, Lcom/google/android/material/internal/a;->o0:Ljava/lang/CharSequence;

    .line 125
    .line 126
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    const-string p2, "\u2026"

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    if-eqz p2, :cond_2

    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    add-int/lit8 p2, p2, -0x1

    .line 147
    .line 148
    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    :cond_2
    iget-object p2, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 153
    .line 154
    invoke-virtual {p2, v0}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 158
    .line 159
    invoke-virtual {p2, p3}, Landroid/text/StaticLayout;->getLineEnd(I)I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 164
    .line 165
    .line 166
    move-result p3

    .line 167
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    const/4 v9, 0x0

    .line 172
    iget-object v11, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 173
    .line 174
    const/4 v7, 0x0

    .line 175
    move-object v5, v1

    .line 176
    move v10, v6

    .line 177
    move-object v6, p1

    .line 178
    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 179
    .line 180
    .line 181
    :cond_3
    return-void
.end method

.method private m0(Landroid/graphics/Typeface;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->E:Ln3/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ln3/a;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/internal/a;->y:Landroid/graphics/Typeface;

    .line 9
    .line 10
    if-eq v0, p1, :cond_2

    .line 11
    .line 12
    iput-object p1, p0, Lcom/google/android/material/internal/a;->y:Landroid/graphics/Typeface;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0, p1}, Ln3/g;->b(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/google/android/material/internal/a;->x:Landroid/graphics/Typeface;

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/google/android/material/internal/a;->y:Landroid/graphics/Typeface;

    .line 37
    .line 38
    :cond_1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->w:Landroid/graphics/Typeface;

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method private n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->g(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/text/StaticLayout;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lez v0, :cond_2

    .line 39
    .line 40
    if-gtz v1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 50
    .line 51
    new-instance v0, Landroid/graphics/Canvas;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/google/android/material/internal/a;->M:Landroid/graphics/Paint;

    .line 64
    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    new-instance v0, Landroid/graphics/Paint;

    .line 68
    .line 69
    const/4 v1, 0x3

    .line 70
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/google/android/material/internal/a;->M:Landroid/graphics/Paint;

    .line 74
    .line 75
    :cond_2
    :goto_0
    return-void
.end method

.method private s(II)F
    .locals 2

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    if-eq p2, v0, :cond_5

    .line 4
    .line 5
    and-int/lit8 v0, p2, 0x7

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_3

    .line 11
    :cond_0
    const p1, 0x800005

    .line 12
    .line 13
    .line 14
    and-int v0, p2, p1

    .line 15
    .line 16
    if-eq v0, p1, :cond_3

    .line 17
    .line 18
    const/4 p1, 0x5

    .line 19
    and-int/2addr p2, p1

    .line 20
    if-ne p2, p1, :cond_1

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    iget-boolean p1, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 28
    .line 29
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 30
    .line 31
    int-to-float p1, p1

    .line 32
    iget p0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 33
    .line 34
    :goto_0
    sub-float/2addr p1, p0

    .line 35
    return p1

    .line 36
    :cond_2
    iget-object p0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 37
    .line 38
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    :goto_1
    int-to-float p0, p0

    .line 41
    return p0

    .line 42
    :cond_3
    :goto_2
    iget-boolean p1, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    iget-object p0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 47
    .line 48
    iget p0, p0, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_4
    iget-object p1, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 52
    .line 53
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    int-to-float p1, p1

    .line 56
    iget p0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_5
    :goto_3
    int-to-float p1, p1

    .line 60
    const/high16 p2, 0x40000000    # 2.0f

    .line 61
    .line 62
    div-float/2addr p1, p2

    .line 63
    iget p0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 64
    .line 65
    div-float/2addr p0, p2

    .line 66
    goto :goto_0
.end method

.method private s0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->n0:F

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p0}, LJ/I;->Z(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private t(Landroid/graphics/RectF;II)F
    .locals 2

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    if-eq p3, v0, :cond_5

    .line 4
    .line 5
    and-int/lit8 v0, p3, 0x7

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_3

    .line 11
    :cond_0
    const p2, 0x800005

    .line 12
    .line 13
    .line 14
    and-int v0, p3, p2

    .line 15
    .line 16
    if-eq v0, p2, :cond_3

    .line 17
    .line 18
    const/4 p2, 0x5

    .line 19
    and-int/2addr p3, p2

    .line 20
    if-ne p3, p2, :cond_1

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    iget-boolean p2, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 24
    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    iget-object p0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 28
    .line 29
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 30
    .line 31
    :goto_0
    int-to-float p0, p0

    .line 32
    return p0

    .line 33
    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 34
    .line 35
    iget p0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 36
    .line 37
    :goto_1
    add-float/2addr p1, p0

    .line 38
    return p1

    .line 39
    :cond_3
    :goto_2
    iget-boolean p2, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 40
    .line 41
    if-eqz p2, :cond_4

    .line 42
    .line 43
    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 44
    .line 45
    iget p0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_4
    iget-object p0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 49
    .line 50
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_5
    :goto_3
    int-to-float p1, p2

    .line 54
    const/high16 p2, 0x40000000    # 2.0f

    .line 55
    .line 56
    div-float/2addr p1, p2

    .line 57
    iget p0, p0, Lcom/google/android/material/internal/a;->l0:F

    .line 58
    .line 59
    div-float/2addr p0, p2

    .line 60
    goto :goto_1
.end method

.method private x(Landroid/content/res/ColorStateList;)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/google/android/material/internal/a;->T:[I

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_1
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private x0(Landroid/graphics/Typeface;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->D:Ln3/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ln3/a;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/internal/a;->B:Landroid/graphics/Typeface;

    .line 9
    .line 10
    if-eq v0, p1, :cond_2

    .line 11
    .line 12
    iput-object p1, p0, Lcom/google/android/material/internal/a;->B:Landroid/graphics/Typeface;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0, p1}, Ln3/g;->b(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/google/android/material/internal/a;->A:Landroid/graphics/Typeface;

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/google/android/material/internal/a;->B:Landroid/graphics/Typeface;

    .line 37
    .line 38
    :cond_1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->z:Landroid/graphics/Typeface;

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method private y()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->x(Landroid/content/res/ColorStateList;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public A()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->Q(Landroid/text/TextPaint;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/text/TextPaint;->ascent()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    neg-float v0, v0

    .line 13
    iget-object p0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/text/TextPaint;->descent()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-float/2addr v0, p0

    .line 20
    return v0
.end method

.method public A0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->d:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->e()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/google/android/material/internal/a;->e:F

    .line 8
    .line 9
    return-void
.end method

.method public B()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public B0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->s0:I

    .line 2
    .line 3
    return-void
.end method

.method public C()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->Q(Landroid/text/TextPaint;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/text/TextPaint;->ascent()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    neg-float p0, p0

    .line 13
    return p0
.end method

.method public D()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public D0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->q0:F

    .line 2
    .line 3
    return-void
.end method

.method public E()Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->z:Landroid/graphics/Typeface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 7
    .line 8
    return-object p0
.end method

.method public E0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->r0:F

    .line 2
    .line 3
    return-void
.end method

.method public F()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public F0(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->j()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public G()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public G0(Landroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->s0:I

    .line 2
    .line 3
    return p0
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/internal/a;->J:Z

    .line 2
    .line 3
    return-void
.end method

.method public I()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/text/StaticLayout;->getLineCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final I0([I)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->T:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->V()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public J()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/text/StaticLayout;->getSpacingAdd()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public J0(Lcom/google/android/material/internal/m;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/internal/a;->b0(Z)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public K()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/text/StaticLayout;->getSpacingMultiplier()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public K0(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->j()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public L()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->p0:I

    .line 2
    .line 3
    return p0
.end method

.method public L0(Landroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->Y:Landroid/animation/TimeInterpolator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M0(Landroid/text/TextUtils$TruncateAt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->F:Landroid/text/TextUtils$TruncateAt;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N()Landroid/animation/TimeInterpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->X:Landroid/animation/TimeInterpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public N0(Landroid/graphics/Typeface;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->m0(Landroid/graphics/Typeface;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->x0(Landroid/graphics/Typeface;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public O()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public R()Landroid/text/TextUtils$TruncateAt;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->F:Landroid/text/TextUtils$TruncateAt;

    .line 2
    .line 3
    return-object p0
.end method

.method public final V()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public Y(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->y:Landroid/graphics/Typeface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, v0}, Ln3/g;->b(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/google/android/material/internal/a;->x:Landroid/graphics/Typeface;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/internal/a;->B:Landroid/graphics/Typeface;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p1, v0}, Ln3/g;->b(Landroid/content/res/Configuration;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/google/android/material/internal/a;->A:Landroid/graphics/Typeface;

    .line 20
    .line 21
    :cond_1
    iget-object p1, p0, Lcom/google/android/material/internal/a;->x:Landroid/graphics/Typeface;

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    iget-object p1, p0, Lcom/google/android/material/internal/a;->y:Landroid/graphics/Typeface;

    .line 27
    .line 28
    :goto_0
    iput-object p1, p0, Lcom/google/android/material/internal/a;->w:Landroid/graphics/Typeface;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/google/android/material/internal/a;->A:Landroid/graphics/Typeface;

    .line 31
    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    iget-object p1, p0, Lcom/google/android/material/internal/a;->B:Landroid/graphics/Typeface;

    .line 36
    .line 37
    :goto_1
    iput-object p1, p0, Lcom/google/android/material/internal/a;->z:Landroid/graphics/Typeface;

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {p0, p1}, Lcom/google/android/material/internal/a;->b0(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/material/internal/a;->b0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-gtz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    if-eqz p1, :cond_2

    .line 18
    .line 19
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->b(Z)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->c()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public d0(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e0(IIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3, p4}, Lcom/google/android/material/internal/a;->c0(Landroid/graphics/Rect;IIII)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/google/android/material/internal/a;->U:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public f0(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/google/android/material/internal/a;->e0(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g0(I)V
    .locals 3

    .line 1
    new-instance v0, Ln3/d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1, p1}, Ln3/d;-><init>(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ln3/d;->i()Landroid/content/res/ColorStateList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ln3/d;->i()Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {v0}, Ln3/d;->j()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/4 v1, 0x0

    .line 29
    cmpl-float p1, p1, v1

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Ln3/d;->j()F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Lcom/google/android/material/internal/a;->m:F

    .line 38
    .line 39
    :cond_1
    iget-object p1, v0, Ln3/d;->c:Landroid/content/res/ColorStateList;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    iput-object p1, p0, Lcom/google/android/material/internal/a;->c0:Landroid/content/res/ColorStateList;

    .line 44
    .line 45
    :cond_2
    iget p1, v0, Ln3/d;->h:F

    .line 46
    .line 47
    iput p1, p0, Lcom/google/android/material/internal/a;->a0:F

    .line 48
    .line 49
    iget p1, v0, Ln3/d;->i:F

    .line 50
    .line 51
    iput p1, p0, Lcom/google/android/material/internal/a;->b0:F

    .line 52
    .line 53
    iget p1, v0, Ln3/d;->j:F

    .line 54
    .line 55
    iput p1, p0, Lcom/google/android/material/internal/a;->Z:F

    .line 56
    .line 57
    iget p1, v0, Ln3/d;->l:F

    .line 58
    .line 59
    iput p1, p0, Lcom/google/android/material/internal/a;->h0:F

    .line 60
    .line 61
    iget-object p1, p0, Lcom/google/android/material/internal/a;->E:Ln3/a;

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1}, Ln3/a;->c()V

    .line 66
    .line 67
    .line 68
    :cond_3
    new-instance p1, Ln3/a;

    .line 69
    .line 70
    new-instance v1, Lcom/google/android/material/internal/a$a;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Lcom/google/android/material/internal/a$a;-><init>(Lcom/google/android/material/internal/a;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ln3/d;->e()Landroid/graphics/Typeface;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-direct {p1, v1, v2}, Ln3/a;-><init>(Ln3/a$a;Landroid/graphics/Typeface;)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/google/android/material/internal/a;->E:Ln3/a;

    .line 83
    .line 84
    iget-object p1, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object v1, p0, Lcom/google/android/material/internal/a;->E:Ln3/a;

    .line 91
    .line 92
    invoke-virtual {v0, p1, v1}, Ln3/d;->h(Landroid/content/Context;Ln3/f;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public i0(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public j0(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->k:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/google/android/material/internal/a;->k:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public k0(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->m:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/google/android/material/internal/a;->m:F

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public l(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/google/android/material/internal/a;->H:Ljava/lang/CharSequence;

    .line 6
    .line 7
    if-eqz v1, :cond_5

    .line 8
    .line 9
    iget-object v1, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    cmpl-float v1, v1, v2

    .line 17
    .line 18
    if-lez v1, :cond_5

    .line 19
    .line 20
    iget-object v1, p0, Lcom/google/android/material/internal/a;->i:Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    cmpl-float v1, v1, v2

    .line 27
    .line 28
    if-lez v1, :cond_5

    .line 29
    .line 30
    iget-object v1, p0, Lcom/google/android/material/internal/a;->V:Landroid/text/TextPaint;

    .line 31
    .line 32
    iget v2, p0, Lcom/google/android/material/internal/a;->O:F

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 35
    .line 36
    .line 37
    iget v1, p0, Lcom/google/android/material/internal/a;->u:F

    .line 38
    .line 39
    iget v2, p0, Lcom/google/android/material/internal/a;->v:F

    .line 40
    .line 41
    iget-boolean v3, p0, Lcom/google/android/material/internal/a;->K:Z

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    iget-object v3, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 47
    .line 48
    if-eqz v3, :cond_0

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v3, v4

    .line 53
    :goto_0
    iget v5, p0, Lcom/google/android/material/internal/a;->N:F

    .line 54
    .line 55
    const/high16 v6, 0x3f800000    # 1.0f

    .line 56
    .line 57
    cmpl-float v6, v5, v6

    .line 58
    .line 59
    if-eqz v6, :cond_1

    .line 60
    .line 61
    iget-boolean v6, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 62
    .line 63
    if-nez v6, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1, v5, v5, v1, v2}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 66
    .line 67
    .line 68
    :cond_1
    if-eqz v3, :cond_2

    .line 69
    .line 70
    iget-object v3, p0, Lcom/google/android/material/internal/a;->L:Landroid/graphics/Bitmap;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/google/android/material/internal/a;->M:Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-virtual {p1, v3, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->O0()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    iget-boolean v3, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 88
    .line 89
    if-eqz v3, :cond_3

    .line 90
    .line 91
    iget v3, p0, Lcom/google/android/material/internal/a;->b:F

    .line 92
    .line 93
    iget v5, p0, Lcom/google/android/material/internal/a;->e:F

    .line 94
    .line 95
    cmpl-float v3, v3, v5

    .line 96
    .line 97
    if-lez v3, :cond_4

    .line 98
    .line 99
    :cond_3
    iget v1, p0, Lcom/google/android/material/internal/a;->u:F

    .line 100
    .line 101
    iget-object v3, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 102
    .line 103
    invoke-virtual {v3, v4}, Landroid/text/StaticLayout;->getLineStart(I)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    int-to-float v3, v3

    .line 108
    sub-float/2addr v1, v3

    .line 109
    invoke-direct {p0, p1, v1, v2}, Lcom/google/android/material/internal/a;->m(Landroid/graphics/Canvas;FF)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_4
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/google/android/material/internal/a;->k0:Landroid/text/StaticLayout;

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 119
    .line 120
    .line 121
    :goto_1
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 122
    .line 123
    .line 124
    :cond_5
    return-void
.end method

.method public l0(Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->m0(Landroid/graphics/Typeface;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public n0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/a;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public o(Landroid/graphics/RectF;II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->G:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->f(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput-boolean v0, p0, Lcom/google/android/material/internal/a;->I:Z

    .line 8
    .line 9
    invoke-direct {p0, p2, p3}, Lcom/google/android/material/internal/a;->s(II)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 27
    .line 28
    int-to-float v0, v0

    .line 29
    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 30
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/material/internal/a;->t(Landroid/graphics/RectF;II)F

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iget-object p3, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 36
    .line 37
    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    int-to-float p3, p3

    .line 40
    invoke-static {p2, p3}, Ljava/lang/Math;->min(FF)F

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p1, Landroid/graphics/RectF;->right:F

    .line 45
    .line 46
    iget-object p2, p0, Lcom/google/android/material/internal/a;->h:Landroid/graphics/Rect;

    .line 47
    .line 48
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
    int-to-float p2, p2

    .line 51
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->r()F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    add-float/2addr p2, p0

    .line 56
    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    .line 57
    .line 58
    return-void
.end method

.method public o0(IIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3, p4}, Lcom/google/android/material/internal/a;->c0(Landroid/graphics/Rect;IIII)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/material/internal/a;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/google/android/material/internal/a;->U:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public p()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public p0(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/google/android/material/internal/a;->o0(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public q0(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->i0:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/google/android/material/internal/a;->i0:F

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public r()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->P(Landroid/text/TextPaint;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/material/internal/a;->W:Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/text/TextPaint;->ascent()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    neg-float p0, p0

    .line 13
    return p0
.end method

.method public r0(I)V
    .locals 3

    .line 1
    new-instance v0, Ln3/d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1, p1}, Ln3/d;-><init>(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ln3/d;->i()Landroid/content/res/ColorStateList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ln3/d;->i()Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {v0}, Ln3/d;->j()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/4 v1, 0x0

    .line 29
    cmpl-float p1, p1, v1

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Ln3/d;->j()F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Lcom/google/android/material/internal/a;->l:F

    .line 38
    .line 39
    :cond_1
    iget-object p1, v0, Ln3/d;->c:Landroid/content/res/ColorStateList;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    iput-object p1, p0, Lcom/google/android/material/internal/a;->g0:Landroid/content/res/ColorStateList;

    .line 44
    .line 45
    :cond_2
    iget p1, v0, Ln3/d;->h:F

    .line 46
    .line 47
    iput p1, p0, Lcom/google/android/material/internal/a;->e0:F

    .line 48
    .line 49
    iget p1, v0, Ln3/d;->i:F

    .line 50
    .line 51
    iput p1, p0, Lcom/google/android/material/internal/a;->f0:F

    .line 52
    .line 53
    iget p1, v0, Ln3/d;->j:F

    .line 54
    .line 55
    iput p1, p0, Lcom/google/android/material/internal/a;->d0:F

    .line 56
    .line 57
    iget p1, v0, Ln3/d;->l:F

    .line 58
    .line 59
    iput p1, p0, Lcom/google/android/material/internal/a;->i0:F

    .line 60
    .line 61
    iget-object p1, p0, Lcom/google/android/material/internal/a;->D:Ln3/a;

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1}, Ln3/a;->c()V

    .line 66
    .line 67
    .line 68
    :cond_3
    new-instance p1, Ln3/a;

    .line 69
    .line 70
    new-instance v1, Lcom/google/android/material/internal/a$b;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Lcom/google/android/material/internal/a$b;-><init>(Lcom/google/android/material/internal/a;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ln3/d;->e()Landroid/graphics/Typeface;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-direct {p1, v1, v2}, Ln3/a;-><init>(Ln3/a$a;Landroid/graphics/Typeface;)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/google/android/material/internal/a;->D:Ln3/a;

    .line 83
    .line 84
    iget-object p1, p0, Lcom/google/android/material/internal/a;->a:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object v1, p0, Lcom/google/android/material/internal/a;->D:Ln3/a;

    .line 91
    .line 92
    invoke-virtual {v0, p1, v1}, Ln3/d;->h(Landroid/content/Context;Ln3/f;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public t0(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/google/android/material/internal/a;->n:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public u()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->m:F

    .line 2
    .line 3
    return p0
.end method

.method public u0(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->j:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/google/android/material/internal/a;->j:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public v()Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/internal/a;->w:Landroid/graphics/Typeface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 7
    .line 8
    return-object p0
.end method

.method public v0(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/material/internal/a;->l:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/google/android/material/internal/a;->l:F

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public w()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/a;->o:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/internal/a;->x(Landroid/content/res/ColorStateList;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public w0(Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/internal/a;->x0(Landroid/graphics/Typeface;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/internal/a;->a0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public y0(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, LE/a;->a(FFF)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget v0, p0, Lcom/google/android/material/internal/a;->b:F

    .line 9
    .line 10
    cmpl-float v0, p1, v0

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iput p1, p0, Lcom/google/android/material/internal/a;->b:F

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/google/android/material/internal/a;->c()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public z()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/internal/a;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/internal/a;->c:Z

    .line 2
    .line 3
    return-void
.end method
