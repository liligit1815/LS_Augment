.class public Landroidx/slice/widget/e;
.super Ljava/lang/Object;
.source "LocationBasedViewTracker.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/e$c;
    }
.end annotation


# static fields
.field private static final j:Landroidx/slice/widget/e$c;

.field private static final k:Landroidx/slice/widget/e$c;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation
.end field


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:Landroid/view/ViewGroup;

.field private final i:Landroidx/slice/widget/e$c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/slice/widget/e$a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/slice/widget/e$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/slice/widget/e;->j:Landroidx/slice/widget/e$c;

    .line 7
    .line 8
    new-instance v0, Landroidx/slice/widget/e$b;

    .line 9
    .line 10
    invoke-direct {v0}, Landroidx/slice/widget/e$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Landroidx/slice/widget/e;->k:Landroidx/slice/widget/e$c;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/slice/widget/e$c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/slice/widget/e;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    iput-object p1, p0, Landroidx/slice/widget/e;->h:Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object p3, p0, Landroidx/slice/widget/e;->i:Landroidx/slice/widget/e$c;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static a(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "accessibility"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->addFocusables(Ljava/util/ArrayList;II)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/View;->isAccessibilityFocused()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const/4 v1, 0x0

    .line 54
    :goto_0
    if-eqz v1, :cond_3

    .line 55
    .line 56
    new-instance v0, Landroidx/slice/widget/e;

    .line 57
    .line 58
    sget-object v2, Landroidx/slice/widget/e;->k:Landroidx/slice/widget/e$c;

    .line 59
    .line 60
    invoke-direct {v0, p0, v1, v2}, Landroidx/slice/widget/e;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/slice/widget/e$c;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    return-void
.end method

.method public static b(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Landroidx/slice/widget/e;

    .line 8
    .line 9
    sget-object v2, Landroidx/slice/widget/e;->j:Landroidx/slice/widget/e$c;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0, v2}, Landroidx/slice/widget/e;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/slice/widget/e$c;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/e;->h:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Landroidx/slice/widget/e;->h:Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public run()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/slice/widget/e;->h:Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v1, v0, v2, v3}, Landroid/view/ViewGroup;->addFocusables(Ljava/util/ArrayList;II)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const v2, 0x7fffffff

    .line 23
    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_2

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    check-cast v4, Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v4, v1}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 39
    .line 40
    .line 41
    iget-object v5, p0, Landroidx/slice/widget/e;->h:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {v5, v4, v1}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 44
    .line 45
    .line 46
    iget-object v5, p0, Landroidx/slice/widget/e;->g:Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-virtual {v5, v1}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-nez v5, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object v5, p0, Landroidx/slice/widget/e;->g:Landroid/graphics/Rect;

    .line 56
    .line 57
    iget v5, v5, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    iget v6, v1, Landroid/graphics/Rect;->left:I

    .line 60
    .line 61
    sub-int/2addr v5, v6

    .line 62
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    iget-object v6, p0, Landroidx/slice/widget/e;->g:Landroid/graphics/Rect;

    .line 67
    .line 68
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 69
    .line 70
    iget v7, v1, Landroid/graphics/Rect;->right:I

    .line 71
    .line 72
    sub-int/2addr v6, v7

    .line 73
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    add-int/2addr v5, v6

    .line 78
    iget-object v6, p0, Landroidx/slice/widget/e;->g:Landroid/graphics/Rect;

    .line 79
    .line 80
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 81
    .line 82
    iget v7, v1, Landroid/graphics/Rect;->top:I

    .line 83
    .line 84
    sub-int/2addr v6, v7

    .line 85
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    add-int/2addr v5, v6

    .line 90
    iget-object v6, p0, Landroidx/slice/widget/e;->g:Landroid/graphics/Rect;

    .line 91
    .line 92
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 93
    .line 94
    iget v7, v1, Landroid/graphics/Rect;->bottom:I

    .line 95
    .line 96
    sub-int/2addr v6, v7

    .line 97
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    add-int/2addr v5, v6

    .line 102
    if-le v2, v5, :cond_0

    .line 103
    .line 104
    move-object v3, v4

    .line 105
    move v2, v5

    .line 106
    goto :goto_0

    .line 107
    :cond_2
    if-eqz v3, :cond_3

    .line 108
    .line 109
    iget-object p0, p0, Landroidx/slice/widget/e;->i:Landroidx/slice/widget/e$c;

    .line 110
    .line 111
    invoke-interface {p0, v3}, Landroidx/slice/widget/e$c;->a(Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    return-void
.end method
