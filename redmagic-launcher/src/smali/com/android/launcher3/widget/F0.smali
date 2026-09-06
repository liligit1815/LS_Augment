.class public Lcom/android/launcher3/widget/F0;
.super Lcom/android/launcher3/widget/T;
.source "PendingAppWidgetHostView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Ls1/P$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/F0$a;
    }
.end annotation


# instance fields
.field private final W:Landroid/graphics/Rect;

.field private final a0:Landroid/graphics/Matrix;

.field private final b0:Landroid/graphics/RectF;

.field private final c0:Landroid/graphics/RectF;

.field private final d0:Landroid/os/Handler;

.field private final e0:Lcom/android/launcher3/util/Y1;

.field private final f0:Lcom/android/launcher3/widget/l0;

.field private final g0:Lcom/android/launcher3/widget/U;

.field private final h0:Lcom/android/launcher3/model/data/A;

.field private final i0:I

.field private final j0:Z

.field private final k0:Ljava/lang/CharSequence;

.field private l0:Landroid/view/View$OnClickListener;

.field private m0:I

.field private n0:Landroid/graphics/drawable/Drawable;

.field private o0:Landroid/graphics/drawable/Drawable;

.field private p0:Z

.field private q0:Z

.field private final r0:Landroid/text/TextPaint;

.field private final s0:Landroid/graphics/Paint;

.field private t0:Landroid/text/Layout;

.field private u0:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;ILcom/android/launcher3/widget/U;)V
    .locals 7

    .line 11
    new-instance v3, Lcom/android/launcher3/model/data/A;

    iget-object v0, p4, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-direct {v3, p3, v0}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    iget-object v5, p4, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/widget/F0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;)V

    .line 12
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const/16 p1, 0x77

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 13
    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object p0, v0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    const/4 p0, 0x4

    .line 14
    iput p0, v0, Lcom/android/launcher3/widget/F0;->m0:I

    const/4 p0, 0x1

    .line 15
    iput-boolean p0, v0, Lcom/android/launcher3/widget/F0;->p0:Z

    .line 16
    iput-boolean p0, v0, Lcom/android/launcher3/widget/F0;->q0:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/widget/F0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;Landroid/graphics/Bitmap;)V
    .locals 9

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1401cc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v8, p5

    .line 3
    invoke-direct/range {v2 .. v8}, Lcom/android/launcher3/widget/F0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;)V

    const/4 p0, 0x0

    .line 4
    invoke-super {v2, p0}, Lcom/android/launcher3/widget/T;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 5
    iget-object p0, v2, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    move-result-object p0

    invoke-virtual {v2, p0}, Lcom/android/launcher3/widget/F0;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    iget-object p0, v5, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    if-nez p0, :cond_0

    .line 7
    new-instance p0, Lcom/android/launcher3/model/data/B;

    iget-object p1, v5, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p1

    iget-object p2, v5, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    iput-object p0, v5, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    .line 8
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    move-result-object p0

    iget-object p1, v5, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    .line 9
    invoke-virtual {p0, v2, p1}, Ls1/P;->W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;

    return-void

    .line 10
    :cond_0
    invoke-virtual {v2, p0}, Lcom/android/launcher3/widget/F0;->i(Lcom/android/launcher3/model/data/z;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 17
    new-instance v0, Landroid/view/ContextThemeWrapper;

    const v1, 0x7f150665

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 18
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 19
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->a0:Landroid/graphics/Matrix;

    .line 20
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->b0:Landroid/graphics/RectF;

    .line 21
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->c0:Landroid/graphics/RectF;

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->d0:Landroid/os/Handler;

    .line 23
    new-instance v0, Lcom/android/launcher3/util/Y1;

    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->e0:Lcom/android/launcher3/util/Y1;

    .line 24
    iput-object p2, p0, Lcom/android/launcher3/widget/F0;->f0:Lcom/android/launcher3/widget/l0;

    .line 25
    iput-object p4, p0, Lcom/android/launcher3/widget/F0;->g0:Lcom/android/launcher3/widget/U;

    .line 26
    iput-object p3, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 27
    iget p2, p3, Lcom/android/launcher3/model/data/A;->i:I

    iput p2, p0, Lcom/android/launcher3/widget/F0;->i0:I

    .line 28
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/P2;->l()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/launcher3/widget/F0;->j0:Z

    .line 29
    iput-object p5, p0, Lcom/android/launcher3/widget/F0;->k0:Ljava/lang/CharSequence;

    .line 30
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/F0;->r0:Landroid/text/TextPaint;

    .line 31
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x1010036

    invoke-static {p2, p3}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setColor(I)V

    .line 32
    iget-object p2, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 33
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p2

    iget p2, p2, Lcom/android/launcher3/h0;->C1:I

    int-to-float p2, p2

    .line 34
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    const/4 p4, 0x0

    .line 35
    invoke-static {p4, p2, p3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 36
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x7

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/android/launcher3/widget/F0;->s0:Landroid/graphics/Paint;

    .line 37
    invoke-virtual {p0, p4}, Landroid/appwidget/AppWidgetHostView;->setWillNotDraw(Z)V

    .line 38
    invoke-virtual {p0, p6}, Lcom/android/launcher3/widget/F0;->setPreviewBitmapAndUpdateBackground(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic a0(Lcom/android/launcher3/widget/F0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/F0;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b0(Lcom/android/launcher3/widget/F0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->d0:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/model/data/A;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d0(Lcom/android/launcher3/widget/F0;)Lcom/android/launcher3/widget/l0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->f0:Lcom/android/launcher3/widget/l0;

    .line 2
    .line 3
    return-object p0
.end method

.method private f0()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/Y0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 11
    .line 12
    iget v1, v1, Lcom/android/launcher3/model/data/A;->g:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/Y0;->h(I)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/android/launcher3/widget/C0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/C0;-><init>(Lcom/android/launcher3/widget/F0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method private k0()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getPaddingBottom()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getPaddingLeft()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getPaddingRight()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    const v7, 0x7f0709d4

    .line 30
    .line 31
    .line 32
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    sub-int/2addr v7, v4

    .line 41
    sub-int/2addr v7, v5

    .line 42
    mul-int/lit8 v5, v6, 0x2

    .line 43
    .line 44
    sub-int v11, v7, v5

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    sub-int/2addr v7, v2

    .line 51
    sub-int/2addr v7, v3

    .line 52
    sub-int/2addr v7, v5

    .line 53
    iget v3, v0, Lcom/android/launcher3/widget/F0;->m0:I

    .line 54
    .line 55
    and-int/lit8 v3, v3, 0x2

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v8, 0x0

    .line 59
    if-nez v3, :cond_0

    .line 60
    .line 61
    move v3, v5

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    invoke-static {v11, v7}, Ljava/lang/Math;->min(II)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    int-to-float v3, v3

    .line 72
    :goto_0
    iget v9, v0, Lcom/android/launcher3/widget/F0;->m0:I

    .line 73
    .line 74
    and-int/lit8 v9, v9, 0x1

    .line 75
    .line 76
    if-nez v9, :cond_1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    const v5, 0x3fe66666    # 1.8f

    .line 80
    .line 81
    .line 82
    :goto_1
    invoke-static {v11, v7}, Ljava/lang/Math;->max(II)I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    mul-float v10, v3, v5

    .line 87
    .line 88
    int-to-float v9, v9

    .line 89
    cmpl-float v10, v10, v9

    .line 90
    .line 91
    if-lez v10, :cond_2

    .line 92
    .line 93
    div-float v3, v9, v5

    .line 94
    .line 95
    :cond_2
    iget v9, v1, Lcom/android/launcher3/h0;->B1:I

    .line 96
    .line 97
    int-to-float v9, v9

    .line 98
    invoke-static {v3, v9}, Ljava/lang/Math;->min(FF)F

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    float-to-int v3, v3

    .line 103
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    sub-int/2addr v9, v3

    .line 108
    div-int/lit8 v16, v9, 0x2

    .line 109
    .line 110
    const/4 v9, 0x0

    .line 111
    iput-object v9, v0, Lcom/android/launcher3/widget/F0;->t0:Landroid/text/Layout;

    .line 112
    .line 113
    if-lez v11, :cond_4

    .line 114
    .line 115
    iget-object v10, v0, Lcom/android/launcher3/widget/F0;->k0:Ljava/lang/CharSequence;

    .line 116
    .line 117
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v10

    .line 121
    if-nez v10, :cond_4

    .line 122
    .line 123
    iget v10, v0, Lcom/android/launcher3/widget/F0;->m0:I

    .line 124
    .line 125
    and-int/lit8 v10, v10, 0x4

    .line 126
    .line 127
    if-eqz v10, :cond_4

    .line 128
    .line 129
    move v10, v8

    .line 130
    new-instance v8, Landroid/text/StaticLayout;

    .line 131
    .line 132
    move-object v12, v9

    .line 133
    iget-object v9, v0, Lcom/android/launcher3/widget/F0;->k0:Ljava/lang/CharSequence;

    .line 134
    .line 135
    move v13, v10

    .line 136
    iget-object v10, v0, Lcom/android/launcher3/widget/F0;->r0:Landroid/text/TextPaint;

    .line 137
    .line 138
    move-object v14, v12

    .line 139
    sget-object v12, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 140
    .line 141
    move-object v15, v14

    .line 142
    const/4 v14, 0x0

    .line 143
    move-object/from16 v17, v15

    .line 144
    .line 145
    const/4 v15, 0x1

    .line 146
    move/from16 v18, v13

    .line 147
    .line 148
    const/high16 v13, 0x3f800000    # 1.0f

    .line 149
    .line 150
    move/from16 v19, v2

    .line 151
    .line 152
    move-object/from16 v2, v17

    .line 153
    .line 154
    invoke-direct/range {v8 .. v15}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 155
    .line 156
    .line 157
    iput-object v8, v0, Lcom/android/launcher3/widget/F0;->t0:Landroid/text/Layout;

    .line 158
    .line 159
    invoke-virtual {v8}, Landroid/text/Layout;->getHeight()I

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    int-to-float v9, v8

    .line 164
    int-to-float v10, v3

    .line 165
    mul-float/2addr v10, v5

    .line 166
    add-float/2addr v9, v10

    .line 167
    iget v5, v1, Lcom/android/launcher3/h0;->D1:I

    .line 168
    .line 169
    int-to-float v5, v5

    .line 170
    add-float/2addr v9, v5

    .line 171
    int-to-float v5, v7

    .line 172
    cmpg-float v5, v9, v5

    .line 173
    .line 174
    if-gez v5, :cond_3

    .line 175
    .line 176
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getHeight()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    sub-int/2addr v2, v8

    .line 181
    iget v5, v1, Lcom/android/launcher3/h0;->D1:I

    .line 182
    .line 183
    sub-int/2addr v2, v5

    .line 184
    sub-int/2addr v2, v3

    .line 185
    div-int/lit8 v16, v2, 0x2

    .line 186
    .line 187
    :goto_2
    move/from16 v2, v16

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_3
    iput-object v2, v0, Lcom/android/launcher3/widget/F0;->t0:Landroid/text/Layout;

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_4
    move/from16 v19, v2

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :goto_3
    iget-object v5, v0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 197
    .line 198
    const/4 v10, 0x0

    .line 199
    invoke-virtual {v5, v10, v10, v3, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 200
    .line 201
    .line 202
    iget-object v5, v0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getWidth()I

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    sub-int/2addr v7, v3

    .line 209
    div-int/lit8 v7, v7, 0x2

    .line 210
    .line 211
    invoke-virtual {v5, v7, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 212
    .line 213
    .line 214
    iget-object v2, v0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 215
    .line 216
    iget-object v5, v0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 217
    .line 218
    invoke-virtual {v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 219
    .line 220
    .line 221
    iget-object v2, v0, Lcom/android/launcher3/widget/F0;->o0:Landroid/graphics/drawable/Drawable;

    .line 222
    .line 223
    if-eqz v2, :cond_5

    .line 224
    .line 225
    iget-object v5, v0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 226
    .line 227
    add-int v7, v4, v6

    .line 228
    .line 229
    iput v7, v5, Landroid/graphics/Rect;->left:I

    .line 230
    .line 231
    const v8, 0x3ecccccd    # 0.4f

    .line 232
    .line 233
    .line 234
    int-to-float v3, v3

    .line 235
    mul-float/2addr v3, v8

    .line 236
    float-to-int v3, v3

    .line 237
    add-int/2addr v7, v3

    .line 238
    iput v7, v5, Landroid/graphics/Rect;->right:I

    .line 239
    .line 240
    add-int v7, v19, v6

    .line 241
    .line 242
    iput v7, v5, Landroid/graphics/Rect;->top:I

    .line 243
    .line 244
    add-int/2addr v7, v3

    .line 245
    iput v7, v5, Landroid/graphics/Rect;->bottom:I

    .line 246
    .line 247
    invoke-virtual {v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 248
    .line 249
    .line 250
    :cond_5
    iget-object v2, v0, Lcom/android/launcher3/widget/F0;->t0:Landroid/text/Layout;

    .line 251
    .line 252
    if-eqz v2, :cond_6

    .line 253
    .line 254
    iget-object v2, v0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 255
    .line 256
    add-int/2addr v4, v6

    .line 257
    iput v4, v2, Landroid/graphics/Rect;->left:I

    .line 258
    .line 259
    iget-object v0, v0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 260
    .line 261
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 266
    .line 267
    iget v1, v1, Lcom/android/launcher3/h0;->D1:I

    .line 268
    .line 269
    add-int/2addr v0, v1

    .line 270
    iput v0, v2, Landroid/graphics/Rect;->top:I

    .line 271
    .line 272
    :cond_6
    return-void
.end method

.method private l0(I)V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    aget v1, v0, p1

    .line 9
    .line 10
    const v2, 0x3f333333    # 0.7f

    .line 11
    .line 12
    .line 13
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    aput v1, v0, p1

    .line 18
    .line 19
    const/4 p1, 0x2

    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    aput v1, v0, p1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->o0:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public T()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    instance-of v2, v1, Lcom/android/launcher3/C2;

    .line 20
    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    check-cast v1, Lcom/android/launcher3/C2;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    const-string v3, "widget removed because of configuration change"

    .line 27
    .line 28
    invoke-virtual {v1, p0, v0, v2, v3}, Lcom/android/launcher3/C2;->o4(Landroid/view/View;Lcom/android/launcher3/model/data/y;ZLjava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lcom/android/launcher3/C2;->a1(Lcom/android/launcher3/model/data/A;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    :goto_0
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    instance-of v1, v0, Ls1/o;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ls1/o;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ls1/o;->k(Ls1/d;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/F0;->i(Lcom/android/launcher3/model/data/z;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 35
    .line 36
    iget p0, p0, Lcom/android/launcher3/model/data/A;->j:I

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public g0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/F0;->q0:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAppWidgetId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/model/data/A;->g:I

    .line 4
    .line 5
    return p0
.end method

.method public getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->g0:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getDefaultView()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/h;->n:Landroid/view/LayoutInflater;

    .line 2
    .line 3
    const v1, 0x7f0e0072

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0;->e0()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public h0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    :cond_0
    return v1

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public i(Lcom/android/launcher3/model/data/z;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x2

    .line 12
    iput v0, p0, Lcom/android/launcher3/widget/F0;->m0:I

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/widget/F0;->j0:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v2}, Ls1/o;->s(Z)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    iput-object v1, p0, Lcom/android/launcher3/widget/F0;->o0:Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0;->h0()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const v1, 0x7f080d6d

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/android/launcher3/widget/F0;->o0:Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 69
    .line 70
    iget p1, p1, Ls1/d;->b:I

    .line 71
    .line 72
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/F0;->l0(I)V

    .line 73
    .line 74
    .line 75
    iget p1, p0, Lcom/android/launcher3/widget/F0;->m0:I

    .line 76
    .line 77
    or-int/lit8 p1, p1, 0x5

    .line 78
    .line 79
    iput p1, p0, Lcom/android/launcher3/widget/F0;->m0:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0, p1}, Ln1/r;->B(Landroid/content/Context;Lcom/android/launcher3/model/data/z;)Ln1/r;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    iput-object v1, p0, Lcom/android/launcher3/widget/F0;->o0:Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0;->e0()V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 100
    .line 101
    .line 102
    iput-boolean v2, p0, Lcom/android/launcher3/widget/F0;->p0:Z

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->invalidate()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public i0()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/F0;->i0:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/model/data/A;->i:I

    .line 6
    .line 7
    if-eq v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/widget/F0$a;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/F0$a;-><init>(Lcom/android/launcher3/widget/F0;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->e0:Lcom/android/launcher3/util/Y1;

    .line 22
    .line 23
    new-instance v2, Lcom/android/launcher3/widget/D0;

    .line 24
    .line 25
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/D0;-><init>(Lcom/android/launcher3/widget/F0$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->d0:Landroid/os/Handler;

    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/widget/E0;

    .line 34
    .line 35
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/E0;-><init>(Lcom/android/launcher3/widget/F0$a;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/T;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->e0:Lcom/android/launcher3/util/Y1;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/util/Y1;->b()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->g0:Lcom/android/launcher3/widget/U;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 23
    .line 24
    iget v1, v0, Lcom/android/launcher3/model/data/A;->i:I

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->f0:Lcom/android/launcher3/widget/l0;

    .line 29
    .line 30
    iget v0, v0, Lcom/android/launcher3/model/data/A;->g:I

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/widget/F0;->g0:Lcom/android/launcher3/widget/U;

    .line 33
    .line 34
    new-instance v3, Lcom/android/launcher3/widget/A0;

    .line 35
    .line 36
    invoke-direct {v3, p0}, Lcom/android/launcher3/widget/A0;-><init>(Lcom/android/launcher3/widget/F0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0, v2, v3}, Lcom/android/launcher3/widget/l0;->p(ILcom/android/launcher3/widget/U;Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->e0:Lcom/android/launcher3/util/Y1;

    .line 44
    .line 45
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    new-instance v2, Lcom/android/launcher3/widget/B0;

    .line 49
    .line 50
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/B0;-><init>(Lcom/android/launcher3/util/a2;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/launcher3/widget/F0;->f0()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/F0;->l0:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/T;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->e0:Lcom/android/launcher3/util/Y1;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->u0:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->h0:Lcom/android/launcher3/model/data/A;

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/model/data/A;->i:I

    .line 8
    .line 9
    and-int/lit8 v1, v1, 0x4

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->b0:Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    iget-object v2, p0, Lcom/android/launcher3/widget/F0;->u0:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v1, v3, v3, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->c0:Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    int-to-float v2, v2

    .line 43
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->a0:Landroid/graphics/Matrix;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->b0:Landroid/graphics/RectF;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/android/launcher3/widget/F0;->c0:Landroid/graphics/RectF;

    .line 51
    .line 52
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->u0:Landroid/graphics/Bitmap;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/widget/F0;->a0:Landroid/graphics/Matrix;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->s0:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {p1, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/F0;->p0:Z

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/android/launcher3/widget/F0;->k0()V

    .line 77
    .line 78
    .line 79
    const/4 v0, 0x0

    .line 80
    iput-boolean v0, p0, Lcom/android/launcher3/widget/F0;->p0:Z

    .line 81
    .line 82
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->o0:Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->t0:Landroid/text/Layout;

    .line 95
    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->W:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 104
    .line 105
    int-to-float v1, v1

    .line 106
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 107
    .line 108
    int-to-float v0, v0

    .line 109
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/android/launcher3/widget/F0;->t0:Landroid/text/Layout;

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 118
    .line 119
    .line 120
    :cond_4
    :goto_0
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/T;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/widget/F0;->p0:Z

    .line 6
    .line 7
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/F0;->l0:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setPreviewBitmapAndUpdateBackground(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const v0, 0x7f081054

    .line 6
    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->u0:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/widget/F0;->u0:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->invalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public updateAppWidget(Landroid/widget/RemoteViews;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/F0;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateAppWidgetSize(Landroid/os/Bundle;IIII)V
    .locals 0

    .line 1
    return-void
.end method

.method public updateAppWidgetSize(Landroid/os/Bundle;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Landroid/util/SizeF;",
            ">;)V"
        }
    .end annotation

    .line 2
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/F0;->n0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method
