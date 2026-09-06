.class final Lcom/google/android/material/internal/l;
.super Ljava/lang/Object;
.source "StaticLayoutBuilderCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/internal/l$a;
    }
.end annotation


# static fields
.field static final n:I


# instance fields
.field private a:Ljava/lang/CharSequence;

.field private final b:Landroid/text/TextPaint;

.field private final c:I

.field private d:I

.field private e:I

.field private f:Landroid/text/Layout$Alignment;

.field private g:I

.field private h:F

.field private i:F

.field private j:I

.field private k:Z

.field private l:Z

.field private m:Landroid/text/TextUtils$TruncateAt;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput v0, Lcom/google/android/material/internal/l;->n:I

    .line 3
    .line 4
    return-void
.end method

.method private constructor <init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/material/internal/l;->a:Ljava/lang/CharSequence;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/material/internal/l;->b:Landroid/text/TextPaint;

    .line 7
    .line 8
    iput p3, p0, Lcom/google/android/material/internal/l;->c:I

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    iput p2, p0, Lcom/google/android/material/internal/l;->d:I

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/google/android/material/internal/l;->e:I

    .line 18
    .line 19
    sget-object p1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/google/android/material/internal/l;->f:Landroid/text/Layout$Alignment;

    .line 22
    .line 23
    const p1, 0x7fffffff

    .line 24
    .line 25
    .line 26
    iput p1, p0, Lcom/google/android/material/internal/l;->g:I

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/google/android/material/internal/l;->h:F

    .line 30
    .line 31
    const/high16 p1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput p1, p0, Lcom/google/android/material/internal/l;->i:F

    .line 34
    .line 35
    sget p1, Lcom/google/android/material/internal/l;->n:I

    .line 36
    .line 37
    iput p1, p0, Lcom/google/android/material/internal/l;->j:I

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/google/android/material/internal/l;->k:Z

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Lcom/google/android/material/internal/l;->m:Landroid/text/TextUtils$TruncateAt;

    .line 44
    .line 45
    return-void
.end method

.method public static b(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Lcom/google/android/material/internal/l;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/material/internal/l;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/material/internal/l;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()Landroid/text/StaticLayout;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/l;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/google/android/material/internal/l;->a:Ljava/lang/CharSequence;

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    iget v1, p0, Lcom/google/android/material/internal/l;->c:I

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/google/android/material/internal/l;->a:Ljava/lang/CharSequence;

    .line 17
    .line 18
    iget v2, p0, Lcom/google/android/material/internal/l;->g:I

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    if-ne v2, v3, :cond_1

    .line 22
    .line 23
    iget-object v2, p0, Lcom/google/android/material/internal/l;->b:Landroid/text/TextPaint;

    .line 24
    .line 25
    int-to-float v4, v0

    .line 26
    iget-object v5, p0, Lcom/google/android/material/internal/l;->m:Landroid/text/TextUtils$TruncateAt;

    .line 27
    .line 28
    invoke-static {v1, v2, v4, v5}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    :cond_1
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget v4, p0, Lcom/google/android/material/internal/l;->e:I

    .line 37
    .line 38
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iput v2, p0, Lcom/google/android/material/internal/l;->e:I

    .line 43
    .line 44
    iget-boolean v4, p0, Lcom/google/android/material/internal/l;->l:Z

    .line 45
    .line 46
    if-eqz v4, :cond_2

    .line 47
    .line 48
    iget v4, p0, Lcom/google/android/material/internal/l;->g:I

    .line 49
    .line 50
    if-ne v4, v3, :cond_2

    .line 51
    .line 52
    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 53
    .line 54
    iput-object v4, p0, Lcom/google/android/material/internal/l;->f:Landroid/text/Layout$Alignment;

    .line 55
    .line 56
    :cond_2
    iget v4, p0, Lcom/google/android/material/internal/l;->d:I

    .line 57
    .line 58
    iget-object v5, p0, Lcom/google/android/material/internal/l;->b:Landroid/text/TextPaint;

    .line 59
    .line 60
    invoke-static {v1, v4, v2, v5, v0}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v1, p0, Lcom/google/android/material/internal/l;->f:Landroid/text/Layout$Alignment;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 67
    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/google/android/material/internal/l;->k:Z

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    .line 72
    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/google/android/material/internal/l;->l:Z

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    sget-object v1, Landroid/text/TextDirectionHeuristics;->RTL:Landroid/text/TextDirectionHeuristic;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    sget-object v1, Landroid/text/TextDirectionHeuristics;->LTR:Landroid/text/TextDirectionHeuristic;

    .line 82
    .line 83
    :goto_0
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setTextDirection(Landroid/text/TextDirectionHeuristic;)Landroid/text/StaticLayout$Builder;

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/google/android/material/internal/l;->m:Landroid/text/TextUtils$TruncateAt;

    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    .line 91
    .line 92
    .line 93
    :cond_4
    iget v1, p0, Lcom/google/android/material/internal/l;->g:I

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setMaxLines(I)Landroid/text/StaticLayout$Builder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/google/android/material/internal/l;->h:F

    .line 99
    .line 100
    const/4 v2, 0x0

    .line 101
    cmpl-float v2, v1, v2

    .line 102
    .line 103
    if-nez v2, :cond_5

    .line 104
    .line 105
    iget v2, p0, Lcom/google/android/material/internal/l;->i:F

    .line 106
    .line 107
    const/high16 v4, 0x3f800000    # 1.0f

    .line 108
    .line 109
    cmpl-float v2, v2, v4

    .line 110
    .line 111
    if-eqz v2, :cond_6

    .line 112
    .line 113
    :cond_5
    iget v2, p0, Lcom/google/android/material/internal/l;->i:F

    .line 114
    .line 115
    invoke-virtual {v0, v1, v2}, Landroid/text/StaticLayout$Builder;->setLineSpacing(FF)Landroid/text/StaticLayout$Builder;

    .line 116
    .line 117
    .line 118
    :cond_6
    iget v1, p0, Lcom/google/android/material/internal/l;->g:I

    .line 119
    .line 120
    if-le v1, v3, :cond_7

    .line 121
    .line 122
    iget p0, p0, Lcom/google/android/material/internal/l;->j:I

    .line 123
    .line 124
    invoke-virtual {v0, p0}, Landroid/text/StaticLayout$Builder;->setHyphenationFrequency(I)Landroid/text/StaticLayout$Builder;

    .line 125
    .line 126
    .line 127
    :cond_7
    invoke-virtual {v0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0
.end method

.method public c(Landroid/text/Layout$Alignment;)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/l;->f:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/text/TextUtils$TruncateAt;)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/l;->m:Landroid/text/TextUtils$TruncateAt;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/l;->j:I

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/internal/l;->k:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/internal/l;->l:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public h(FF)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/l;->h:F

    .line 2
    .line 3
    iput p2, p0, Lcom/google/android/material/internal/l;->i:F

    .line 4
    .line 5
    return-object p0
.end method

.method public i(I)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/internal/l;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Lcom/google/android/material/internal/m;)Lcom/google/android/material/internal/l;
    .locals 0

    .line 1
    return-object p0
.end method
