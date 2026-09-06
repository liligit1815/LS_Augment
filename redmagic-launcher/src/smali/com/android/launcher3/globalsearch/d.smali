.class public Lcom/android/launcher3/globalsearch/d;
.super Ljava/lang/Object;
.source "GSAppLocationAnim.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/globalsearch/d$i;,
        Lcom/android/launcher3/globalsearch/d$h;,
        Lcom/android/launcher3/globalsearch/d$g;
    }
.end annotation


# instance fields
.field private a:Landroid/graphics/Rect;

.field private b:Lcom/android/launcher3/globalsearch/r$b;

.field private c:Landroid/content/ComponentName;

.field private d:Landroid/os/UserHandle;

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/globalsearch/d$h;",
            ">;"
        }
    .end annotation
.end field

.field private f:Lcom/android/launcher3/globalsearch/d$i;


# direct methods
.method constructor <init>()V
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
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/d;->a:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/d;->j(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/d;->p(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/globalsearch/d;Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/d;->q(Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/BubbleTextView;
    .locals 6

    .line 1
    invoke-virtual {p3}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p3}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0x7f0b022d

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v2}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 17
    .line 18
    iget v3, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    if-lez v3, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const v5, 0x7f0e00dc

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v5, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const v5, 0x7f0e006d

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v5, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 57
    .line 58
    :goto_0
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 59
    .line 60
    invoke-virtual {v3, p2}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iget p2, p2, Lcom/android/launcher3/h0;->D1:I

    .line 68
    .line 69
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p3}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {v3, p2}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget p1, p1, Lcom/android/launcher3/X3;->s:I

    .line 84
    .line 85
    invoke-virtual {v3, v4, p1, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lx1/O;->C3()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    invoke-static {p3}, Lp1/f;->x(Landroid/view/View;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_1

    .line 99
    .line 100
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingTop()I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingRight()I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    invoke-virtual {v3, p1, p2, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    :cond_1
    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    instance-of p1, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 124
    .line 125
    if-eqz p1, :cond_2

    .line 126
    .line 127
    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    check-cast p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    new-instance p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 135
    .line 136
    invoke-direct {p1, v0, v1}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 137
    .line 138
    .line 139
    :goto_1
    iget-object p2, p0, Lcom/android/launcher3/globalsearch/d;->a:Landroid/graphics/Rect;

    .line 140
    .line 141
    invoke-virtual {v2, p3, p2}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 142
    .line 143
    .line 144
    const/4 p2, 0x1

    .line 145
    iput-boolean p2, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 146
    .line 147
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d;->a:Landroid/graphics/Rect;

    .line 148
    .line 149
    iget p2, p0, Landroid/graphics/Rect;->left:I

    .line 150
    .line 151
    iput p2, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 152
    .line 153
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 154
    .line 155
    iput p0, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 156
    .line 157
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 158
    .line 159
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 160
    .line 161
    invoke-virtual {v2, v3, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    .line 163
    .line 164
    return-object v3
.end method

.method private h(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/y;
    .locals 1

    .line 1
    new-instance p0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    invoke-static {p0, p2}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 p2, 0x0

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    return-object p2

    .line 21
    :cond_0
    iget-object p1, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p1, v0}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/util/Collection;

    .line 45
    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 70
    .line 71
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 72
    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    move-object p2, p1

    .line 76
    goto :goto_0

    .line 77
    :cond_3
    :goto_1
    return-object p2
.end method

.method private i(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/p;)[J
    .locals 4

    .line 1
    const/4 p0, 0x2

    .line 2
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 3
    .line 4
    const-string v1, "Global_Search_GSAppLocationAnim"

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    const-string p1, "findItemLocation folderInfo container was not found!"

    .line 12
    .line 13
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    new-array p0, p0, [J

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v3, v0, Lcom/android/launcher3/F1;->K0:[I

    .line 28
    .line 29
    aget v3, v3, v2

    .line 30
    .line 31
    iget-object v0, v0, Lcom/android/launcher3/F1;->J0:[I

    .line 32
    .line 33
    aget v0, v0, v2

    .line 34
    .line 35
    mul-int/2addr v3, v0

    .line 36
    iget p3, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 37
    .line 38
    invoke-virtual {p1, p3}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz v3, :cond_2

    .line 43
    .line 44
    iget p2, p2, Lcom/android/launcher3/model/data/y;->rank:I

    .line 45
    .line 46
    div-int/2addr p2, v3

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget p2, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    :cond_2
    move p2, v2

    .line 55
    :goto_0
    new-instance p3, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v0, "pageId-folderContainer-folderPageId : "

    .line 61
    .line 62
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, "-"

    .line 69
    .line 70
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-static {v1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    int-to-long v0, p1

    .line 84
    int-to-long p1, p2

    .line 85
    new-array p0, p0, [J

    .line 86
    .line 87
    aput-wide v0, p0, v2

    .line 88
    .line 89
    const/4 p3, 0x1

    .line 90
    aput-wide p1, p0, p3

    .line 91
    .line 92
    return-object p0
.end method

.method private j(Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, p1

    .line 8
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v0, v2, :cond_4

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    instance-of v2, v2, Lcom/android/launcher3/folder/Folder;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getZ()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    instance-of v2, v2, Lcom/android/launcher3/globalsearch/d$g;

    .line 35
    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    instance-of v2, v2, Lcom/android/launcher3/BubbleTextView;

    .line 43
    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    :cond_1
    cmpl-float v2, v1, p1

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const/high16 v3, 0x3f800000    # 1.0f

    .line 55
    .line 56
    add-float/2addr v3, v1

    .line 57
    invoke-virtual {v2, v3}, Landroid/view/View;->setZ(F)V

    .line 58
    .line 59
    .line 60
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v3, "i:"

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v3, " getZ():"

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Landroid/view/View;->getZ()F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v3, " class: "

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const-string v3, "Global_Search_GSAppLocationAnim"

    .line 110
    .line 111
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_4
    return-void
.end method

.method private k(Landroid/os/Handler;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)Lcom/android/launcher3/globalsearch/d$h;
    .locals 8

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {v1, p2}, Lcom/android/launcher3/Workspace;->c1(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    .line 9
    move-result-object v5

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "Global_Search_GSAppLocationAnim"

    .line 12
    .line 13
    if-nez v5, :cond_0

    .line 14
    .line 15
    const-string p1, "iconTwinkleRunnable, target view is null."

    .line 16
    .line 17
    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p3}, Lcom/android/launcher3/globalsearch/d;->p(Lcom/android/launcher3/C2;)V

    .line 21
    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_0
    instance-of v3, p2, Lcom/android/launcher3/model/data/I;

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    const-string p1, "iconTwinkleRunnable, item info is not short cut info instance."

    .line 29
    .line 30
    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p3}, Lcom/android/launcher3/globalsearch/d;->p(Lcom/android/launcher3/C2;)V

    .line 38
    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_1
    invoke-direct {p0, p3, p2, v5}, Lcom/android/launcher3/globalsearch/d;->f(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/BubbleTextView;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const/4 p2, 0x4

    .line 46
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/android/launcher3/G2;->e()Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v2, Lcom/android/launcher3/globalsearch/d$e;

    .line 54
    .line 55
    move-object v3, p0

    .line 56
    move-object v7, p1

    .line 57
    move-object v6, p3

    .line 58
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/globalsearch/d$e;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/C2;Landroid/os/Handler;)V

    .line 59
    .line 60
    .line 61
    const-string p0, "ScaleX"

    .line 62
    .line 63
    new-array p1, v0, [F

    .line 64
    .line 65
    fill-array-data p1, :array_0

    .line 66
    .line 67
    .line 68
    invoke-static {v4, p0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-wide/16 v5, 0x258

    .line 73
    .line 74
    invoke-virtual {p0, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    const-string p1, "ScaleY"

    .line 78
    .line 79
    new-array p3, v0, [F

    .line 80
    .line 81
    fill-array-data p3, :array_1

    .line 82
    .line 83
    .line 84
    invoke-static {v4, p1, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1, v5, v6}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    new-instance p3, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Lcom/android/launcher3/G2;->d()Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 105
    .line 106
    .line 107
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2, p3}, Landroid/animation/AnimatorSet;->playSequentially(Ljava/util/List;)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Lcom/android/launcher3/globalsearch/d$f;

    .line 114
    .line 115
    invoke-direct {p0, v3, p2, v2}, Lcom/android/launcher3/globalsearch/d$f;-><init>(Lcom/android/launcher3/globalsearch/d;Landroid/animation/AnimatorSet;Landroid/animation/Animator$AnimatorListener;)V

    .line 116
    .line 117
    .line 118
    return-object p0

    .line 119
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private l(Landroid/os/Handler;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/globalsearch/d$h;
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iget-object v0, p2, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 8
    .line 9
    if-ne v0, p3, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance p3, Lcom/android/launcher3/globalsearch/d$a;

    .line 13
    .line 14
    invoke-direct {p3, p0, p2, p1}, Lcom/android/launcher3/globalsearch/d$a;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/folder/Folder;Landroid/os/Handler;)V

    .line 15
    .line 16
    .line 17
    return-object p3

    .line 18
    :cond_1
    :goto_0
    const-string p0, "Global_Search_GSAppLocationAnim"

    .line 19
    .line 20
    const-string p1, "initCloseFolderRunnable return! for the openFolder is null or the currentOpenFolder is finalFolder!!"

    .line 21
    .line 22
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method private m(Landroid/os/Handler;JLcom/android/launcher3/model/data/p;Lcom/android/launcher3/Workspace;)Lcom/android/launcher3/globalsearch/d$h;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p2, p2, v0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    if-ltz p2, :cond_3

    .line 7
    .line 8
    if-nez p4, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p5, p4}, Lcom/android/launcher3/Workspace;->n1(Ljava/lang/Object;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 16
    .line 17
    if-eqz p2, :cond_3

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    if-nez p4, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    invoke-virtual {p4}, Lcom/android/launcher3/folder/Folder;->getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;

    .line 31
    .line 32
    .line 33
    move-result-object p4

    .line 34
    if-nez p4, :cond_2

    .line 35
    .line 36
    return-object p3

    .line 37
    :cond_2
    new-instance p3, Lcom/android/launcher3/globalsearch/d$c;

    .line 38
    .line 39
    invoke-direct {p3, p0, p2, p1}, Lcom/android/launcher3/globalsearch/d$c;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/folder/FolderIcon;Landroid/os/Handler;)V

    .line 40
    .line 41
    .line 42
    :cond_3
    :goto_0
    return-object p3
.end method

.method private n(Landroid/os/Handler;Lcom/android/launcher3/C2;JLcom/android/launcher3/model/data/p;ILcom/android/launcher3/Workspace;)Lcom/android/launcher3/globalsearch/d$h;
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p3, p3, v0

    .line 4
    .line 5
    const/4 p4, 0x0

    .line 6
    if-ltz p3, :cond_3

    .line 7
    .line 8
    if-eqz p5, :cond_3

    .line 9
    .line 10
    if-nez p6, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p7, p5}, Lcom/android/launcher3/Workspace;->n1(Ljava/lang/Object;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Lcom/android/launcher3/folder/FolderIcon;

    .line 18
    .line 19
    if-eqz p3, :cond_3

    .line 20
    .line 21
    invoke-virtual {p3}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 22
    .line 23
    .line 24
    move-result-object p5

    .line 25
    if-nez p5, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p3}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p3}, Lcom/android/launcher3/folder/Folder;->getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-nez v2, :cond_2

    .line 37
    .line 38
    return-object p4

    .line 39
    :cond_2
    new-instance p3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string p4, "folderPageId: "

    .line 45
    .line 46
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    const-string p4, "Global_Search_GSAppLocationAnim"

    .line 57
    .line 58
    invoke-static {p4, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    new-instance v0, Lcom/android/launcher3/globalsearch/d$d;

    .line 62
    .line 63
    move-object v1, p0

    .line 64
    move-object v3, p1

    .line 65
    move-object v4, p2

    .line 66
    move v5, p6

    .line 67
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/globalsearch/d$d;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/folder/FolderPagedView;Landroid/os/Handler;Lcom/android/launcher3/C2;I)V

    .line 68
    .line 69
    .line 70
    return-object v0

    .line 71
    :cond_3
    :goto_0
    return-object p4
.end method

.method private o(Landroid/os/Handler;JLcom/android/launcher3/Workspace;I)Lcom/android/launcher3/globalsearch/d$h;
    .locals 2

    .line 1
    const-wide/16 v0, -0x65

    .line 2
    .line 3
    cmp-long p2, v0, p2

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p4}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-ne p2, p5, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p2, Lcom/android/launcher3/globalsearch/d$b;

    .line 15
    .line 16
    invoke-direct {p2, p0, p4, p1, p5}, Lcom/android/launcher3/globalsearch/d$b;-><init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/Workspace;Landroid/os/Handler;I)V

    .line 17
    .line 18
    .line 19
    return-object p2

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method private p(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    const p0, 0x7f0b022d

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    add-int/lit8 p1, p1, -0x1

    .line 15
    .line 16
    :goto_0
    if-ltz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Lcom/android/launcher3/globalsearch/d$g;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method private q(Landroid/os/Handler;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x65

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private t()V
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d;->c:Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, "Global_Search_GSAppLocationAnim"

    .line 4
    .line 5
    if-eqz v0, :cond_f

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d;->d:Landroid/os/UserHandle;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    if-nez v4, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 21
    .line 22
    .line 23
    move-result-object v9

    .line 24
    if-nez v9, :cond_2

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_2
    const/4 v0, 0x0

    .line 28
    invoke-virtual {v9, v0}, Lcom/android/launcher3/Workspace;->setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/d;->c:Landroid/content/ComponentName;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/launcher3/globalsearch/d;->d:Landroid/os/UserHandle;

    .line 34
    .line 35
    invoke-direct {p0, v2, v3}, Lcom/android/launcher3/globalsearch/d;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-nez v2, :cond_3

    .line 40
    .line 41
    const-string p0, "startFistTask--findItemInfoMathCondition is null, do nothing"

    .line 42
    .line 43
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_3
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    if-nez v3, :cond_4

    .line 52
    .line 53
    const-string p0, "startFistTask--bgDataModel is null, do nothing"

    .line 54
    .line 55
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    iget-object v3, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    new-instance v5, Lcom/android/launcher3/globalsearch/c;

    .line 66
    .line 67
    invoke-direct {v5}, Lcom/android/launcher3/globalsearch/c;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-interface {v3, v5}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-interface {v3}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    if-eqz v5, :cond_6

    .line 87
    .line 88
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 93
    .line 94
    iget v6, v5, Lcom/android/launcher3/model/data/y;->id:I

    .line 95
    .line 96
    iget v7, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 97
    .line 98
    if-ne v6, v7, :cond_5

    .line 99
    .line 100
    move-object v0, v5

    .line 101
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 102
    .line 103
    :cond_6
    iget v3, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 104
    .line 105
    int-to-long v11, v3

    .line 106
    invoke-direct {p0, v9, v2, v0}, Lcom/android/launcher3/globalsearch/d;->i(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/p;)[J

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    const/4 v13, 0x0

    .line 111
    aget-wide v5, v2, v13

    .line 112
    .line 113
    long-to-int v10, v5

    .line 114
    const/4 v14, 0x1

    .line 115
    aget-wide v2, v2, v14

    .line 116
    .line 117
    long-to-int v2, v2

    .line 118
    new-instance v3, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v5, "startFistTask: itemContainer "

    .line 124
    .line 125
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v5, "="

    .line 132
    .line 133
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 153
    .line 154
    if-nez v1, :cond_7

    .line 155
    .line 156
    new-instance v1, Ljava/util/ArrayList;

    .line 157
    .line 158
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v1, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 162
    .line 163
    :cond_7
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 164
    .line 165
    invoke-direct {p0, v1, v4, v0}, Lcom/android/launcher3/globalsearch/d;->l(Landroid/os/Handler;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/globalsearch/d$h;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    if-eqz v1, :cond_8

    .line 170
    .line 171
    iget-object v3, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    :cond_8
    iget-object v6, p0, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 177
    .line 178
    const-wide/16 v7, 0x0

    .line 179
    .line 180
    cmp-long v1, v11, v7

    .line 181
    .line 182
    if-lez v1, :cond_9

    .line 183
    .line 184
    iget v1, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 185
    .line 186
    int-to-long v7, v1

    .line 187
    :goto_1
    move-object v5, p0

    .line 188
    goto :goto_2

    .line 189
    :cond_9
    move-wide v7, v11

    .line 190
    goto :goto_1

    .line 191
    :goto_2
    invoke-direct/range {v5 .. v10}, Lcom/android/launcher3/globalsearch/d;->o(Landroid/os/Handler;JLcom/android/launcher3/Workspace;I)Lcom/android/launcher3/globalsearch/d$h;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    if-eqz p0, :cond_a

    .line 196
    .line 197
    iget-object v1, v5, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    :cond_a
    iget-object v6, v5, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 203
    .line 204
    move-object v10, v9

    .line 205
    move-wide v7, v11

    .line 206
    move-object v9, v0

    .line 207
    invoke-direct/range {v5 .. v10}, Lcom/android/launcher3/globalsearch/d;->m(Landroid/os/Handler;JLcom/android/launcher3/model/data/p;Lcom/android/launcher3/Workspace;)Lcom/android/launcher3/globalsearch/d$h;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    move-wide v0, v7

    .line 212
    move-object v7, v9

    .line 213
    move-object v9, v10

    .line 214
    if-eqz p0, :cond_b

    .line 215
    .line 216
    iget-object v3, v5, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 217
    .line 218
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    :cond_b
    iget-object v3, v5, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 222
    .line 223
    move v8, v2

    .line 224
    move-object v2, v5

    .line 225
    move-wide v5, v0

    .line 226
    invoke-direct/range {v2 .. v9}, Lcom/android/launcher3/globalsearch/d;->n(Landroid/os/Handler;Lcom/android/launcher3/C2;JLcom/android/launcher3/model/data/p;ILcom/android/launcher3/Workspace;)Lcom/android/launcher3/globalsearch/d$h;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    move-object v5, v2

    .line 231
    if-eqz p0, :cond_c

    .line 232
    .line 233
    iget-object v0, v5, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 234
    .line 235
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    :cond_c
    iget-object p0, v5, Lcom/android/launcher3/globalsearch/d;->b:Lcom/android/launcher3/globalsearch/r$b;

    .line 239
    .line 240
    if-eqz p0, :cond_d

    .line 241
    .line 242
    invoke-interface {p0, v14}, Lcom/android/launcher3/globalsearch/r$b;->a(Z)V

    .line 243
    .line 244
    .line 245
    :cond_d
    iget-object p0, v5, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-eqz p0, :cond_e

    .line 252
    .line 253
    iget-object p0, v5, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 254
    .line 255
    invoke-interface {p0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    check-cast p0, Lcom/android/launcher3/globalsearch/d$h;

    .line 260
    .line 261
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_e
    invoke-virtual {v5}, Lcom/android/launcher3/globalsearch/d;->g()V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_f
    :goto_3
    const-string p0, "startFistTask,mCm == null || mUser == null"

    .line 270
    .line 271
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    return-void
.end method

.method private u()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "Global_Search_GSAppLocationAnim"

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p0, "startIconTwinkle-launcher is null, do nothing"

    .line 11
    .line 12
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/globalsearch/d;->c:Landroid/content/ComponentName;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/android/launcher3/globalsearch/d;->d:Landroid/os/UserHandle;

    .line 19
    .line 20
    invoke-direct {p0, v3, v4}, Lcom/android/launcher3/globalsearch/d;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/y;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    const-string p0, "startIconTwinkle-findItemInfoMathCondition is null, do nothing"

    .line 27
    .line 28
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/globalsearch/d;->e(Lcom/android/launcher3/C2;)V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 36
    .line 37
    invoke-direct {p0, v4, v3, v0}, Lcom/android/launcher3/globalsearch/d;->k(Landroid/os/Handler;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)Lcom/android/launcher3/globalsearch/d$h;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_2
    const-string p0, "startIconTwinkle-iconTwinkleTask is null, do nothing"

    .line 49
    .line 50
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return v1
.end method


# virtual methods
.method protected e(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    const p0, 0x7f0b022d

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/h1$a;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-direct {v0, v1, v1, v2}, Lcom/android/launcher3/h1$a;-><init>(IIZ)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lcom/android/launcher3/globalsearch/d$g;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Lcom/android/launcher3/globalsearch/d$g;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    const/high16 p1, -0x1000000

    .line 23
    .line 24
    const/16 v2, 0x8c

    .line 25
    .line 26
    invoke-static {p1, v2}, Ls1/q;->h(II)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d;->b:Lcom/android/launcher3/globalsearch/r$b;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {v0, v2}, Lcom/android/launcher3/globalsearch/r$b;->a(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/android/launcher3/globalsearch/d;->r(Lcom/android/launcher3/globalsearch/r$b;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v3, "doNextAnimTask: "

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v3, "Global_Search_GSAppLocationAnim"

    .line 42
    .line 43
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    invoke-direct {p0}, Lcom/android/launcher3/globalsearch/d;->u()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput-object v1, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    const-string v0, "doNextAnimTask: fail to execute all the location animation, reset isLocationAnimRunning state!!"

    .line 63
    .line 64
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d;->b:Lcom/android/launcher3/globalsearch/r$b;

    .line 68
    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    invoke-interface {p0, v2}, Lcom/android/launcher3/globalsearch/r$b;->a(Z)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void

    .line 75
    :cond_2
    const-wide/16 v0, 0xb4

    .line 76
    .line 77
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    .line 80
    :catch_0
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d;->e:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Lcom/android/launcher3/globalsearch/d$h;

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public r(Lcom/android/launcher3/globalsearch/r$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d;->b:Lcom/android/launcher3/globalsearch/r$b;

    .line 2
    .line 3
    return-void
.end method

.method public s(Landroid/content/ComponentName;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Global_Search_GSAppLocationAnim"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "showAppLocationAnimate--launcher is null, do nothing"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string p0, "showAppLocationAnimate--workspace is null, do nothing"

    .line 22
    .line 23
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/globalsearch/d;->h(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    const-string v0, "showAppLocationAnimate--findItemInfoMathCondition is null, do nothing"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_2
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d;->c:Landroid/content/ComponentName;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/d;->d:Landroid/os/UserHandle;

    .line 41
    .line 42
    new-instance p1, Lcom/android/launcher3/globalsearch/d$i;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/android/launcher3/globalsearch/d$i;-><init>(Lcom/android/launcher3/globalsearch/d;)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d;->f:Lcom/android/launcher3/globalsearch/d$i;

    .line 48
    .line 49
    invoke-direct {p0}, Lcom/android/launcher3/globalsearch/d;->t()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
