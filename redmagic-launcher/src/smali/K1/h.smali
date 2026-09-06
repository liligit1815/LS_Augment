.class public LK1/h;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "PreferenceHighlighter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LK1/h$d;
    }
.end annotation


# static fields
.field private static final n:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "LK1/h;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final o:I


# instance fields
.field private final g:Landroid/graphics/Paint;

.field private final h:Landroidx/recyclerview/widget/RecyclerView;

.field private final i:I

.field private final j:Landroidx/preference/Preference;

.field private final k:Landroid/graphics/RectF;

.field private l:Z

.field private m:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LK1/h$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "highlightColor"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, LK1/h$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, LK1/h;->n:Landroid/util/Property;

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ls1/q;->h(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    sput v0, LK1/h;->o:I

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/preference/Preference;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LK1/h;->g:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LK1/h;->k:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, LK1/h;->l:Z

    .line 20
    .line 21
    sget v0, LK1/h;->o:I

    .line 22
    .line 23
    iput v0, p0, LK1/h;->m:I

    .line 24
    .line 25
    iput-object p1, p0, LK1/h;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 26
    .line 27
    iput p2, p0, LK1/h;->i:I

    .line 28
    .line 29
    iput-object p3, p0, LK1/h;->j:Landroidx/preference/Preference;

    .line 30
    .line 31
    return-void
.end method

.method static bridge synthetic a(LK1/h;)I
    .locals 0

    .line 1
    iget p0, p0, LK1/h;->m:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(LK1/h;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, LK1/h;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(LK1/h;I)V
    .locals 0

    .line 1
    iput p1, p0, LK1/h;->m:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(LK1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/h;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 3

    .line 1
    sget-object v0, LK1/h;->n:Landroid/util/Property;

    .line 2
    .line 3
    iget v1, p0, LK1/h;->m:I

    .line 4
    .line 5
    sget v2, LK1/h;->o:I

    .line 6
    .line 7
    filled-new-array {v1, v2}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-wide/16 v1, 0x1f4

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x3a98

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 23
    .line 24
    .line 25
    new-instance v1, LK1/h$c;

    .line 26
    .line 27
    invoke-direct {v1, p0}, LK1/h$c;-><init>(LK1/h;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 4

    .line 1
    iget v0, p0, LK1/h;->i:I

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v1, p0, LK1/h;->l:Z

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$State;->getRemainingScrollVertical()I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-eqz p3, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    iget-boolean p3, p0, LK1/h;->l:Z

    .line 22
    .line 23
    if-nez p3, :cond_2

    .line 24
    .line 25
    iget-object p3, p0, LK1/h;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 26
    .line 27
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-static {p3}, Lcom/android/launcher3/util/F2;->h(Landroid/content/Context;)I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    const/16 v1, 0x42

    .line 36
    .line 37
    invoke-static {p3, v1}, Ls1/q;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    sget-object v1, LK1/h;->n:Landroid/util/Property;

    .line 42
    .line 43
    sget v2, LK1/h;->o:I

    .line 44
    .line 45
    filled-new-array {v2, p3}, [I

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-static {p0, v1, p3}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    const-wide/16 v1, 0xc8

    .line 54
    .line 55
    invoke-virtual {p3, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    .line 58
    const/4 v1, 0x2

    .line 59
    invoke-virtual {p3, v1}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 60
    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p3, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 64
    .line 65
    .line 66
    new-instance v1, LK1/h$b;

    .line 67
    .line 68
    invoke-direct {v1, p0}, LK1/h$b;-><init>(LK1/h;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p3}, Landroid/animation/ObjectAnimator;->start()V

    .line 75
    .line 76
    .line 77
    const/4 p3, 0x1

    .line 78
    iput-boolean p3, p0, LK1/h;->l:Z

    .line 79
    .line 80
    :cond_2
    iget-object p3, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 81
    .line 82
    iget-object v0, p0, LK1/h;->g:Landroid/graphics/Paint;

    .line 83
    .line 84
    iget v1, p0, LK1/h;->m:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, LK1/h;->k:Landroid/graphics/RectF;

    .line 90
    .line 91
    invoke-virtual {p3}, Landroid/view/View;->getY()F

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getWidth()I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    int-to-float p2, p2

    .line 100
    invoke-virtual {p3}, Landroid/view/View;->getY()F

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    int-to-float v3, v3

    .line 109
    add-float/2addr v2, v3

    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-virtual {v0, v3, v1, p2, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, LK1/h;->j:Landroidx/preference/Preference;

    .line 115
    .line 116
    instance-of v0, p2, LK1/h$d;

    .line 117
    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    check-cast p2, LK1/h$d;

    .line 121
    .line 122
    iget-object v0, p0, LK1/h;->k:Landroid/graphics/RectF;

    .line 123
    .line 124
    invoke-interface {p2, p3, v0}, LK1/h$d;->a(Landroid/view/View;Landroid/graphics/RectF;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object p2, p0, LK1/h;->k:Landroid/graphics/RectF;

    .line 128
    .line 129
    iget-object p0, p0, LK1/h;->g:Landroid/graphics/Paint;

    .line 130
    .line 131
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, LK1/h;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LK1/h;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    iget p0, p0, LK1/h;->i:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
