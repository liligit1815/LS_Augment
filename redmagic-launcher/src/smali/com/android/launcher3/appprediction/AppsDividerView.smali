.class public Lcom/android/launcher3/appprediction/AppsDividerView;
.super Landroid/view/View;
.source "AppsDividerView.java"

# interfaces
.implements Lcom/android/launcher3/allapps/P;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/appprediction/AppsDividerView$a;
    }
.end annotation


# instance fields
.field private final g:Landroid/text/TextPaint;

.field private h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

.field private final i:I

.field private final j:I

.field private final k:Landroid/view/accessibility/AccessibilityManager;

.field private l:Landroid/text/Layout;

.field private m:Z

.field private n:Lcom/android/launcher3/allapps/FloatingHeaderView;

.field private o:Z

.field private p:[Lcom/android/launcher3/allapps/P;

.field private q:Z

.field private final r:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/appprediction/AppsDividerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/text/TextPaint;

    invoke-direct {p2}, Landroid/text/TextPaint;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 4
    sget-object p2, Lcom/android/launcher3/appprediction/AppsDividerView$a;->g:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    iput-object p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 5
    sget-object p2, Lcom/android/launcher3/allapps/P;->e:[Lcom/android/launcher3/allapps/P;

    iput-object p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->p:[Lcom/android/launcher3/allapps/P;

    const/4 p2, 0x0

    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->q:Z

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0700bf

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f0700bc

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    filled-new-array {p2, p3}, [I

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->r:[I

    const p2, 0x7f060451

    .line 9
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->i:I

    const p2, 0x7f06044b

    .line 10
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->j:I

    .line 11
    invoke-static {p1}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->k:Landroid/view/accessibility/AccessibilityManager;

    .line 12
    sget-object p2, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/launcher3/appprediction/AppsDividerView;->setShowAllAppsLabel(Z)V

    return-void
.end method

.method private e()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->o:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/appprediction/AppsDividerView$a;->g:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->p:[Lcom/android/launcher3/allapps/P;

    .line 11
    .line 12
    array-length v3, v0

    .line 13
    move v4, v2

    .line 14
    move v5, v4

    .line 15
    :goto_0
    if-ge v4, v3, :cond_3

    .line 16
    .line 17
    aget-object v6, v0, v4

    .line 18
    .line 19
    if-ne v6, p0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-interface {v6}, Lcom/android/launcher3/allapps/P;->c()Z

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    if-eqz v6, :cond_2

    .line 27
    .line 28
    add-int/lit8 v5, v5, 0x1

    .line 29
    .line 30
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    :goto_1
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->m:Z

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    if-lez v5, :cond_4

    .line 38
    .line 39
    sget-object v0, Lcom/android/launcher3/appprediction/AppsDividerView$a;->i:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_4
    if-ne v5, v1, :cond_5

    .line 43
    .line 44
    sget-object v0, Lcom/android/launcher3/appprediction/AppsDividerView$a;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_5
    sget-object v0, Lcom/android/launcher3/appprediction/AppsDividerView$a;->g:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 48
    .line 49
    :goto_2
    iget-object v3, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 50
    .line 51
    if-eq v3, v0, :cond_8

    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-virtual {p0, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eq v0, v1, :cond_7

    .line 64
    .line 65
    const/4 v1, 0x2

    .line 66
    if-eq v0, v1, :cond_6

    .line 67
    .line 68
    move v0, v2

    .line 69
    goto :goto_3

    .line 70
    :cond_6
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->getAllAppsLabelLayout()Landroid/text/Layout;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/text/Layout;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const v2, 0x7f0700d7

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int v2, v0, v1

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const v1, 0x7f0700d5

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget-object v1, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 103
    .line 104
    iget v3, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->j:I

    .line 105
    .line 106
    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->l:Landroid/text/Layout;

    .line 110
    .line 111
    invoke-virtual {v1}, Landroid/text/Layout;->getText()Ljava/lang/CharSequence;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const v1, 0x7f0700dc

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget-object v1, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 131
    .line 132
    iget v3, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->i:I

    .line 133
    .line 134
    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 135
    .line 136
    .line 137
    :goto_3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 146
    .line 147
    .line 148
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->f()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->n:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 158
    .line 159
    if-eqz p0, :cond_8

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->n()V

    .line 162
    .line 163
    .line 164
    :cond_8
    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/appprediction/AppsDividerView$a;->g:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->q:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private getAllAppsLabelLayout()Landroid/text/Layout;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->l:Landroid/text/Layout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 12
    .line 13
    const-string v2, "google-sans"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-static {v2, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const v4, 0x7f0700d6

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    int-to-float v2, v2

    .line 37
    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const v2, 0x7f14006d

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v4, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    invoke-static {v0, v3, v2, v4, v5}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setMaxLines(I)Landroid/text/StaticLayout$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->l:Landroid/text/Layout;

    .line 92
    .line 93
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->l:Landroid/text/Layout;

    .line 94
    .line 95
    return-object p0
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b(IZ)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->q:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/appprediction/AppsDividerView$a;->g:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public d(Lcom/android/launcher3/allapps/FloatingHeaderView;[Lcom/android/launcher3/allapps/P;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->n:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->o:Z

    .line 4
    .line 5
    iput-object p2, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->p:[Lcom/android/launcher3/allapps/P;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getDividerType()Lcom/android/launcher3/appprediction/AppsDividerView$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExpectedHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public getFocusedChild()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getTypeClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/android/launcher3/appprediction/AppsDividerView;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/android/launcher3/appprediction/AppsDividerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/appprediction/AppsDividerView$a;->h:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->r:[I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    aget v1, v1, v2

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    div-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    div-int/lit8 v3, v3, 0x2

    .line 28
    .line 29
    sub-int/2addr v1, v3

    .line 30
    iget-object v3, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->r:[I

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    aget v4, v3, v4

    .line 34
    .line 35
    int-to-float v6, v0

    .line 36
    int-to-float v7, v1

    .line 37
    aget v2, v3, v2

    .line 38
    .line 39
    add-int/2addr v0, v2

    .line 40
    int-to-float v8, v0

    .line 41
    add-int/2addr v1, v4

    .line 42
    int-to-float v9, v1

    .line 43
    int-to-float v10, v4

    .line 44
    iget-object v12, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->g:Landroid/text/TextPaint;

    .line 45
    .line 46
    move v11, v10

    .line 47
    move-object v5, p1

    .line 48
    invoke-virtual/range {v5 .. v12}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    move-object v5, p1

    .line 53
    sget-object p1, Lcom/android/launcher3/appprediction/AppsDividerView$a;->i:Lcom/android/launcher3/appprediction/AppsDividerView$a;

    .line 54
    .line 55
    if-ne v0, p1, :cond_1

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->getAllAppsLabelLayout()Landroid/text/Layout;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    div-int/lit8 v0, v0, 0x2

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/text/Layout;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    div-int/lit8 v1, v1, 0x2

    .line 72
    .line 73
    sub-int/2addr v0, v1

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    sub-int/2addr v1, p0

    .line 83
    invoke-virtual {p1}, Landroid/text/Layout;->getHeight()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    sub-int/2addr v1, p0

    .line 88
    int-to-float p0, v0

    .line 89
    int-to-float v2, v1

    .line 90
    invoke-virtual {v5, p0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v5}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 94
    .line 95
    .line 96
    neg-int p0, v0

    .line 97
    int-to-float p0, p0

    .line 98
    neg-int p1, v1

    .line 99
    int-to-float p1, p1

    .line 100
    invoke-virtual {v5, p0, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 101
    .line 102
    .line 103
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2, p1}, Landroid/view/View;->getDefaultSize(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p2, v0

    .line 18
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setShowAllAppsLabel(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->k:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->m:Z

    .line 17
    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/android/launcher3/appprediction/AppsDividerView;->m:Z

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/AppsDividerView;->e()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method
