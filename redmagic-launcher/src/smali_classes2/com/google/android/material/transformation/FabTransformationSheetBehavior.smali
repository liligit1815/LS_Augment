.class public Lcom/google/android/material/transformation/FabTransformationSheetBehavior;
.super Lcom/google/android/material/transformation/FabTransformationBehavior;
.source "FabTransformationSheetBehavior.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private o:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/transformation/FabTransformationBehavior;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/transformation/FabTransformationBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private k0(Landroid/view/View;Z)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    new-instance v2, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Lcom/google/android/material/transformation/FabTransformationSheetBehavior;->o:Ljava/util/Map;

    .line 25
    .line 26
    :cond_1
    const/4 v2, 0x0

    .line 27
    move v3, v2

    .line 28
    :goto_0
    if-ge v3, v1, :cond_6

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    instance-of v5, v5, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 39
    .line 40
    if-eqz v5, :cond_2

    .line 41
    .line 42
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    check-cast v5, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 47
    .line 48
    invoke-virtual {v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    instance-of v5, v5, Lcom/google/android/material/transformation/FabTransformationScrimBehavior;

    .line 53
    .line 54
    if-eqz v5, :cond_2

    .line 55
    .line 56
    const/4 v5, 0x1

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v5, v2

    .line 59
    :goto_1
    if-eq v4, p1, :cond_5

    .line 60
    .line 61
    if-eqz v5, :cond_3

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    if-nez p2, :cond_4

    .line 65
    .line 66
    iget-object v5, p0, Lcom/google/android/material/transformation/FabTransformationSheetBehavior;->o:Ljava/util/Map;

    .line 67
    .line 68
    if-eqz v5, :cond_5

    .line 69
    .line 70
    invoke-interface {v5, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-eqz v5, :cond_5

    .line 75
    .line 76
    iget-object v5, p0, Lcom/google/android/material/transformation/FabTransformationSheetBehavior;->o:Ljava/util/Map;

    .line 77
    .line 78
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    check-cast v5, Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    invoke-static {v4, v5}, LJ/I;->t0(Landroid/view/View;I)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_4
    iget-object v5, p0, Lcom/google/android/material/transformation/FabTransformationSheetBehavior;->o:Ljava/util/Map;

    .line 93
    .line 94
    invoke-virtual {v4}, Landroid/view/View;->getImportantForAccessibility()I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    const/4 v5, 0x4

    .line 106
    invoke-static {v4, v5}, LJ/I;->t0(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_6
    if-nez p2, :cond_7

    .line 113
    .line 114
    const/4 p1, 0x0

    .line 115
    iput-object p1, p0, Lcom/google/android/material/transformation/FabTransformationSheetBehavior;->o:Ljava/util/Map;

    .line 116
    .line 117
    :cond_7
    :goto_3
    return-void
.end method


# virtual methods
.method protected L(Landroid/view/View;Landroid/view/View;ZZ)Z
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Lcom/google/android/material/transformation/FabTransformationSheetBehavior;->k0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;->L(Landroid/view/View;Landroid/view/View;ZZ)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method protected i0(Landroid/content/Context;Z)Lcom/google/android/material/transformation/FabTransformationBehavior$e;
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget p0, LX2/a;->d:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p0, LX2/a;->c:I

    .line 7
    .line 8
    :goto_0
    new-instance p2, Lcom/google/android/material/transformation/FabTransformationBehavior$e;

    .line 9
    .line 10
    invoke-direct {p2}, Lcom/google/android/material/transformation/FabTransformationBehavior$e;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, p0}, LY2/h;->c(Landroid/content/Context;I)LY2/h;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iput-object p0, p2, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->a:LY2/h;

    .line 18
    .line 19
    new-instance p0, LY2/j;

    .line 20
    .line 21
    const/16 p1, 0x11

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0, v0}, LY2/j;-><init>(IFF)V

    .line 25
    .line 26
    .line 27
    iput-object p0, p2, Lcom/google/android/material/transformation/FabTransformationBehavior$e;->b:LY2/j;

    .line 28
    .line 29
    return-object p2
.end method
