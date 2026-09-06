.class public Lcom/android/launcher3/dragndrop/DragLayer;
.super Lcom/android/launcher3/views/BaseDragLayer;
.source "DragLayer.java"

# interfaces
.implements Lz2/a$b;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/BaseDragLayer<",
        "Lcom/android/launcher3/C2;",
        ">;",
        "Lz2/a$b;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final g:Z

.field private h:Lcom/android/launcher3/dragndrop/j;

.field private i:Landroid/animation/Animator;

.field private j:Lcom/android/launcher3/dragndrop/v;

.field private k:Z

.field private l:I

.field private m:I

.field private final n:Lcom/android/launcher3/keyboard/b;

.field private o:Ln1/s;

.field private p:Lcom/android/quickstep/util/animation/SpringAnimationImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/BaseDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->k:Z

    .line 12
    .line 13
    const/4 p2, -0x1

    .line 14
    iput p2, p0, Lcom/android/launcher3/dragndrop/DragLayer;->m:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setMotionEventSplittingEnabled(Z)V

    .line 17
    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setChildrenDrawingOrderEnabled(Z)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Lcom/android/launcher3/keyboard/b;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/android/launcher3/dragndrop/DragLayer;->n:Lcom/android/launcher3/keyboard/b;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iput-boolean p2, p0, Lcom/android/launcher3/dragndrop/DragLayer;->g:Z

    .line 39
    .line 40
    invoke-virtual {p0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;-><init>(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->p:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic c(Landroid/view/View;IFLjava/lang/Float;Ljava/lang/Float;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    invoke-static {p2, p3, p4}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sub-int/2addr p1, p0

    .line 22
    int-to-float p0, p1

    .line 23
    mul-float/2addr p3, p0

    .line 24
    add-float/2addr p2, p3

    .line 25
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/dragndrop/DragLayer;Landroid/view/View;Lcom/android/launcher3/K5;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/DragLayer;->n(Landroid/view/View;Lcom/android/launcher3/K5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->D1()LO0/r;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, LO0/c;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private synthetic n(Landroid/view/View;Lcom/android/launcher3/K5;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lx1/O;->C3()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const-string v2, "DragLayer"

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    instance-of v1, v1, Lcom/android/launcher3/Hotseat;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    instance-of v1, v1, Lcom/android/launcher3/model/data/I;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    instance-of v1, p1, Lcom/android/launcher3/BubbleTextView;

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    const-string v3, "multiScr: remove data from dock recent if the data is duplicate."

    .line 56
    .line 57
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    invoke-static {p0}, Lx1/O;->H2(Lcom/android/launcher3/C2;)Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Lcom/android/launcher3/q4;->T()Lcom/android/launcher3/MFVDockExpandSupport;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3}, Lcom/android/launcher3/MFVDockExpandSupport;->r()Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v5, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 83
    .line 84
    const/4 v6, 0x1

    .line 85
    invoke-static {v3, v4, v6, v0, v5}, Lx1/O;->v1(Ljava/util/ArrayList;Landroid/content/ComponentName;ZZLandroid/os/UserHandle;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_0

    .line 90
    .line 91
    invoke-virtual {p0, v1, v6}, Lcom/android/launcher3/C2;->Q3(Lcom/android/launcher3/model/data/I;Z)V

    .line 92
    .line 93
    .line 94
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    const-string v1, "animateViewIntoPosition.onCompleteRunnable: child="

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v1, ", childParent.getParent()="

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    instance-of v0, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 127
    .line 128
    if-eqz v0, :cond_2

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    instance-of v0, v0, Lcom/android/launcher3/model/data/p;

    .line 135
    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    instance-of p2, p2, Lcom/android/launcher3/Hotseat;

    .line 143
    .line 144
    if-nez p2, :cond_2

    .line 145
    .line 146
    if-eqz p0, :cond_2

    .line 147
    .line 148
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 149
    .line 150
    invoke-interface {p0, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-eqz p2, :cond_2

    .line 155
    .line 156
    move-object p2, p1

    .line 157
    check-cast p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 164
    .line 165
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 166
    .line 167
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 168
    .line 169
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    if-eqz p0, :cond_1

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->isVisible(Landroid/view/View;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_1

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    if-nez p0, :cond_1

    .line 190
    .line 191
    invoke-static {}, Lx1/O;->k1()Z

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    if-nez p0, :cond_1

    .line 196
    .line 197
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-nez p0, :cond_1

    .line 206
    .line 207
    const-string p0, "animateViewIntoPosition: show FolderIconResizeFrame"

    .line 208
    .line 209
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    invoke-static {p2, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;->e0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_1
    const-string p0, "animateViewIntoPosition: not show FolderIconResizeFrame"

    .line 217
    .line 218
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    :cond_2
    return-void
.end method

.method private synthetic o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 3
    .line 4
    return-void
.end method

.method private q(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const p1, 0x7f1401b0

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const p1, 0x7f1401af

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendCustomAccessibilityEvent(Landroid/view/View;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private s()V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->l:I

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    instance-of v2, v2, Lcom/android/launcher3/dragndrop/v;

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iput v1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->l:I

    .line 20
    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iput v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->m:I

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-float/2addr v0, v1

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    mul-float/2addr v1, p1

    .line 14
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 21
    .line 22
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    mul-float/2addr v1, p1

    .line 36
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->g:Z

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    neg-float v1, v1

    .line 41
    :cond_1
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getAlphaProperty(I)Lcom/android/launcher3/util/v1$c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public addChildrenForAccessibility(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    const v1, 0x7d2afc97

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->m()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->addAccessibleChildToList(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void

    .line 35
    :cond_1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->addChildrenForAccessibility(Ljava/util/ArrayList;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public bringChildToFront(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->s()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->o:Ln1/s;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ln1/s;->a(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->n:Lcom/android/launcher3/keyboard/b;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->h:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->p(Landroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 10
    .line 11
    check-cast v0, Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Y1()Lcom/android/launcher3/globalsearch/s;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "DragLayer"

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v3, "Don\'t dispatch touchEvent: isGSAppAnimRunning. Current springChainRunning is "

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget-boolean v3, Lcom/android/launcher3/W3;->A:Z

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    neg-float p0, p0

    .line 52
    invoke-virtual {p1, p0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :catchall_0
    move-exception v0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 60
    .line 61
    .line 62
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    neg-float p0, p0

    .line 68
    invoke-virtual {p1, p0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 69
    .line 70
    .line 71
    return v0

    .line 72
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    neg-float p0, p0

    .line 77
    invoke-virtual {p1, p0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 78
    .line 79
    .line 80
    throw v0
.end method

.method public f(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Rect;FFFILandroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V
    .locals 9

    .line 1
    move-object/from16 v0, p10

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->o()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 7
    .line 8
    .line 9
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/views/BaseDragLayer;->getViewLocationRelativeToSelf(Landroid/view/View;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v2, p2, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aget v4, v1, v3

    .line 17
    .line 18
    sub-int/2addr v2, v4

    .line 19
    int-to-double v4, v2

    .line 20
    iget v2, p2, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    const/4 v6, 0x1

    .line 23
    aget v1, v1, v6

    .line 24
    .line 25
    sub-int/2addr v2, v1

    .line 26
    int-to-double v1, v2

    .line 27
    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    double-to-float v1, v1

    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const v4, 0x7f0c002e

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    int-to-float v4, v4

    .line 44
    if-gez p6, :cond_1

    .line 45
    .line 46
    const v5, 0x7f0c002f

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    cmpg-float v7, v1, v4

    .line 54
    .line 55
    if-gez v7, :cond_0

    .line 56
    .line 57
    int-to-float v5, v5

    .line 58
    sget-object v7, LJ0/h;->J:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    div-float/2addr v1, v4

    .line 61
    invoke-interface {v7, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    mul-float/2addr v5, v1

    .line 66
    float-to-int v5, v5

    .line 67
    :cond_0
    const v1, 0x7f0c0030

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move v1, p6

    .line 80
    :goto_0
    if-nez p7, :cond_3

    .line 81
    .line 82
    if-gez p6, :cond_2

    .line 83
    .line 84
    new-instance v2, Landroid/view/animation/PathInterpolator;

    .line 85
    .line 86
    const v4, 0x3e99999a    # 0.3f

    .line 87
    .line 88
    .line 89
    const/high16 v5, 0x3f800000    # 1.0f

    .line 90
    .line 91
    const v7, 0x3ee147ae    # 0.44f

    .line 92
    .line 93
    .line 94
    const v8, 0x3e428f5c    # 0.19f

    .line 95
    .line 96
    .line 97
    invoke-direct {v2, v7, v8, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    sget-object v2, LJ0/h;->J:Landroid/view/animation/Interpolator;

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_3
    move-object/from16 v2, p7

    .line 105
    .line 106
    :goto_1
    new-instance v4, Lcom/android/launcher3/anim/V;

    .line 107
    .line 108
    int-to-long v7, v1

    .line 109
    invoke-direct {v4, v7, v8}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 110
    .line 111
    .line 112
    sget-object v1, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 113
    .line 114
    new-array v5, v6, [F

    .line 115
    .line 116
    aput p4, v5, v3

    .line 117
    .line 118
    invoke-static {p1, v1, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object p4

    .line 122
    sget-object v1, Lcom/android/launcher3/anim/g0;->d:Lcom/android/launcher3/anim/g0;

    .line 123
    .line 124
    invoke-virtual {v4, p4, v2, v1}, Lcom/android/launcher3/anim/V;->o(Landroid/animation/Animator;Landroid/animation/TimeInterpolator;Lcom/android/launcher3/anim/g0;)V

    .line 125
    .line 126
    .line 127
    sget-object p4, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 128
    .line 129
    new-array v5, v6, [F

    .line 130
    .line 131
    aput p5, v5, v3

    .line 132
    .line 133
    invoke-static {p1, p4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 134
    .line 135
    .line 136
    move-result-object p4

    .line 137
    invoke-virtual {v4, p4, v2, v1}, Lcom/android/launcher3/anim/V;->o(Landroid/animation/Animator;Landroid/animation/TimeInterpolator;Lcom/android/launcher3/anim/g0;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, p1, p3, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 141
    .line 142
    .line 143
    sget-object p3, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 144
    .line 145
    iget p4, p2, Landroid/graphics/Rect;->top:I

    .line 146
    .line 147
    int-to-float p4, p4

    .line 148
    invoke-virtual {v4, p1, p3, p4, v2}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    sget-object p3, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 152
    .line 153
    iget p2, p2, Landroid/graphics/Rect;->left:I

    .line 154
    .line 155
    int-to-float p2, p2

    .line 156
    new-array p4, v6, [F

    .line 157
    .line 158
    aput p2, p4, v3

    .line 159
    .line 160
    invoke-static {p1, p3, p4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    new-instance p4, Lcom/android/launcher3/dragndrop/l;

    .line 171
    .line 172
    invoke-direct {p4, v0, p3}, Lcom/android/launcher3/dragndrop/l;-><init>(Landroid/view/View;I)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p2, p4}, Landroid/animation/ObjectAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 176
    .line 177
    .line 178
    :cond_4
    invoke-virtual {v4, p2, v2, v1}, Lcom/android/launcher3/anim/V;->o(Landroid/animation/Animator;Landroid/animation/TimeInterpolator;Lcom/android/launcher3/anim/g0;)V

    .line 179
    .line 180
    .line 181
    if-eqz p8, :cond_5

    .line 182
    .line 183
    invoke-static/range {p8 .. p8}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-virtual {v4, p2}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 188
    .line 189
    .line 190
    :cond_5
    invoke-static {p1}, Lx1/v;->f(Landroid/view/View;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v4}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    move/from16 p3, p9

    .line 198
    .line 199
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/dragndrop/DragLayer;->p(Lcom/android/launcher3/dragndrop/v;Landroid/animation/Animator;I)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public g(Lcom/android/launcher3/dragndrop/v;IIFFFLjava/lang/Runnable;IILandroid/view/View;)V
    .locals 3

    .line 1
    move v0, p2

    .line 2
    new-instance p2, Landroid/graphics/Rect;

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    add-int/2addr v1, v0

    .line 9
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    add-int/2addr v2, p3

    .line 14
    invoke-direct {p2, v0, p3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 15
    .line 16
    .line 17
    move p3, p4

    .line 18
    move p4, p5

    .line 19
    move p5, p6

    .line 20
    move p6, p9

    .line 21
    move p9, p8

    .line 22
    move-object p8, p7

    .line 23
    const/4 p7, 0x0

    .line 24
    invoke-virtual/range {p0 .. p10}, Lcom/android/launcher3/dragndrop/DragLayer;->f(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Rect;FFFILandroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public getAnimatedView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getChildDrawingOrder(II)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->m:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->l:I

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 15
    .line 16
    if-ne p2, p1, :cond_2

    .line 17
    .line 18
    return p0

    .line 19
    :cond_2
    if-ge p2, p0, :cond_3

    .line 20
    .line 21
    :goto_0
    return p2

    .line 22
    :cond_3
    add-int/lit8 p2, p2, 0x1

    .line 23
    .line 24
    return p2
.end method

.method public getFocusIndicatorHelper()Lcom/android/launcher3/keyboard/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->n:Lcom/android/launcher3/keyboard/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->p:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWorkspaceDragScrim()Ln1/s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->o:Ln1/s;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;ILandroid/view/View;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lcom/android/launcher3/K5;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    const-string v0, "DragLayer"

    .line 14
    .line 15
    const-string v1, "DragLayer animateViewIntoPosition childParent is null "

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lc1/b;

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Lcom/android/launcher3/K5;->n(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v1}, Lcom/android/launcher3/K5;->m(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    const/4 v4, 0x2

    .line 34
    new-array v5, v4, [F

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/View;->getScaleX()F

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    invoke-static {v1}, Lp1/f;->t(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    const/4 v8, 0x0

    .line 45
    if-eqz v7, :cond_1

    .line 46
    .line 47
    move v7, v8

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget v7, v3, Lc1/b;->k:I

    .line 50
    .line 51
    :goto_0
    iput v7, v3, Lc1/b;->k:I

    .line 52
    .line 53
    iget v7, v3, Lc1/b;->j:I

    .line 54
    .line 55
    int-to-float v7, v7

    .line 56
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 57
    .line 58
    .line 59
    move-result v9

    .line 60
    int-to-float v9, v9

    .line 61
    const/high16 v10, 0x3f800000    # 1.0f

    .line 62
    .line 63
    sub-float v11, v10, v6

    .line 64
    .line 65
    mul-float/2addr v9, v11

    .line 66
    const/high16 v12, 0x40000000    # 2.0f

    .line 67
    .line 68
    div-float/2addr v9, v12

    .line 69
    add-float/2addr v7, v9

    .line 70
    aput v7, v5, v8

    .line 71
    .line 72
    iget v7, v3, Lc1/b;->k:I

    .line 73
    .line 74
    int-to-float v7, v7

    .line 75
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    int-to-float v9, v9

    .line 80
    mul-float/2addr v9, v11

    .line 81
    div-float/2addr v9, v12

    .line 82
    add-float/2addr v7, v9

    .line 83
    const/4 v9, 0x1

    .line 84
    aput v7, v5, v9

    .line 85
    .line 86
    invoke-virtual {v2}, Lcom/android/launcher3/K5;->getTranslationProvider()Lcom/android/launcher3/K5$a;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    if-eqz v7, :cond_2

    .line 91
    .line 92
    aget v11, v5, v8

    .line 93
    .line 94
    invoke-virtual {v3}, Lc1/b;->a()I

    .line 95
    .line 96
    .line 97
    move-result v13

    .line 98
    invoke-interface {v7, v13}, Lcom/android/launcher3/K5$a;->a(I)F

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    add-float/2addr v11, v7

    .line 103
    aput v11, v5, v8

    .line 104
    .line 105
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    check-cast v7, Landroid/view/View;

    .line 110
    .line 111
    invoke-virtual {v0, v7, v5}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[F)F

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    mul-float/2addr v7, v6

    .line 116
    aget v6, v5, v8

    .line 117
    .line 118
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    aget v5, v5, v9

    .line 123
    .line 124
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    instance-of v8, v1, Lcom/android/launcher3/dragndrop/y;

    .line 129
    .line 130
    const/4 v11, 0x4

    .line 131
    if-eqz v8, :cond_6

    .line 132
    .line 133
    move-object v8, v1

    .line 134
    check-cast v8, Lcom/android/launcher3/dragndrop/y;

    .line 135
    .line 136
    new-instance v13, Landroid/graphics/Rect;

    .line 137
    .line 138
    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-interface {v8, v13}, Lcom/android/launcher3/dragndrop/y;->d(Landroid/graphics/Rect;)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Lx1/O;->C3()Z

    .line 145
    .line 146
    .line 147
    move-result v8

    .line 148
    if-eqz v8, :cond_3

    .line 149
    .line 150
    iget-object v8, v0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 151
    .line 152
    check-cast v8, Lcom/android/launcher3/views/k;

    .line 153
    .line 154
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 155
    .line 156
    .line 157
    move-result-object v8

    .line 158
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 159
    .line 160
    .line 161
    move-result-object v8

    .line 162
    iget-boolean v8, v8, Lcom/android/launcher3/h0;->N0:Z

    .line 163
    .line 164
    if-nez v8, :cond_3

    .line 165
    .line 166
    instance-of v8, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 167
    .line 168
    if-eqz v8, :cond_3

    .line 169
    .line 170
    move-object v8, v1

    .line 171
    check-cast v8, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 172
    .line 173
    iget-object v14, v8, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 174
    .line 175
    iget v15, v14, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 176
    .line 177
    if-ne v15, v9, :cond_3

    .line 178
    .line 179
    iget v14, v14, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 180
    .line 181
    if-ne v14, v9, :cond_3

    .line 182
    .line 183
    invoke-virtual {v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F1()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v8}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 187
    .line 188
    .line 189
    :cond_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 190
    .line 191
    .line 192
    move-result v8

    .line 193
    if-eqz v8, :cond_4

    .line 194
    .line 195
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 196
    .line 197
    .line 198
    move-result-object v8

    .line 199
    instance-of v8, v8, Lcom/android/launcher3/Hotseat;

    .line 200
    .line 201
    if-eqz v8, :cond_4

    .line 202
    .line 203
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 204
    .line 205
    .line 206
    iget-object v8, v0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 207
    .line 208
    check-cast v8, Lcom/android/launcher3/views/k;

    .line 209
    .line 210
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 211
    .line 212
    .line 213
    move-result-object v8

    .line 214
    invoke-static {v8}, Lp1/f;->p(Lcom/android/launcher3/C2;)I

    .line 215
    .line 216
    .line 217
    move-result v14

    .line 218
    add-int/2addr v14, v9

    .line 219
    invoke-static {v8, v14}, Lp1/f;->q(Lcom/android/launcher3/C2;I)I

    .line 220
    .line 221
    .line 222
    move-result v9

    .line 223
    invoke-static {v8, v14}, Lp1/f;->n(Lcom/android/launcher3/C2;I)I

    .line 224
    .line 225
    .line 226
    move-result v15

    .line 227
    invoke-static {v8, v14}, Lp1/f;->i(Lcom/android/launcher3/C2;I)I

    .line 228
    .line 229
    .line 230
    move-result v16

    .line 231
    invoke-static {v8, v14}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 232
    .line 233
    .line 234
    move-result v14

    .line 235
    invoke-static {v8}, Lp1/f;->h(Lcom/android/launcher3/C2;)I

    .line 236
    .line 237
    .line 238
    move-result v17

    .line 239
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 240
    .line 241
    .line 242
    move-result-object v8

    .line 243
    iget v8, v8, Lcom/android/launcher3/h0;->T0:I

    .line 244
    .line 245
    sub-int/2addr v8, v9

    .line 246
    int-to-float v8, v8

    .line 247
    div-float/2addr v8, v12

    .line 248
    sub-int/2addr v9, v15

    .line 249
    int-to-float v9, v9

    .line 250
    div-float/2addr v9, v12

    .line 251
    add-float/2addr v8, v9

    .line 252
    float-to-int v8, v8

    .line 253
    invoke-virtual {v3}, Lc1/b;->a()I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    mul-int/2addr v3, v14

    .line 258
    add-int/2addr v8, v3

    .line 259
    int-to-float v3, v8

    .line 260
    int-to-float v8, v14

    .line 261
    div-float/2addr v8, v12

    .line 262
    add-float/2addr v3, v8

    .line 263
    sub-int v14, v14, v16

    .line 264
    .line 265
    div-int/2addr v14, v4

    .line 266
    sub-int v17, v17, v16

    .line 267
    .line 268
    div-int/lit8 v4, v17, 0x2

    .line 269
    .line 270
    add-int v8, v14, v16

    .line 271
    .line 272
    add-int v9, v4, v16

    .line 273
    .line 274
    invoke-virtual {v13, v14, v4, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 275
    .line 276
    .line 277
    goto :goto_1

    .line 278
    :cond_4
    const/4 v3, 0x0

    .line 279
    :goto_1
    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    .line 280
    .line 281
    .line 282
    move-result v4

    .line 283
    int-to-float v4, v4

    .line 284
    mul-float/2addr v4, v10

    .line 285
    invoke-virtual/range {p1 .. p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 286
    .line 287
    .line 288
    move-result v8

    .line 289
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher3/dragndrop/v;->getBlurSizeOutline()I

    .line 290
    .line 291
    .line 292
    move-result v9

    .line 293
    sub-int/2addr v8, v9

    .line 294
    int-to-float v8, v8

    .line 295
    div-float/2addr v4, v8

    .line 296
    mul-float/2addr v4, v7

    .line 297
    invoke-virtual/range {p1 .. p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 298
    .line 299
    .line 300
    move-result v8

    .line 301
    int-to-float v8, v8

    .line 302
    sub-float/2addr v10, v4

    .line 303
    mul-float/2addr v8, v10

    .line 304
    div-float/2addr v8, v12

    .line 305
    invoke-virtual/range {p1 .. p1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 306
    .line 307
    .line 308
    move-result v9

    .line 309
    int-to-float v9, v9

    .line 310
    mul-float/2addr v9, v10

    .line 311
    div-float/2addr v9, v12

    .line 312
    int-to-float v6, v6

    .line 313
    iget v10, v13, Landroid/graphics/Rect;->left:I

    .line 314
    .line 315
    int-to-float v10, v10

    .line 316
    mul-float/2addr v10, v7

    .line 317
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher3/dragndrop/v;->getBlurSizeOutline()I

    .line 318
    .line 319
    .line 320
    move-result v14

    .line 321
    int-to-float v14, v14

    .line 322
    mul-float/2addr v14, v4

    .line 323
    div-float/2addr v14, v12

    .line 324
    sub-float/2addr v10, v14

    .line 325
    sub-float/2addr v10, v8

    .line 326
    add-float/2addr v6, v10

    .line 327
    float-to-int v6, v6

    .line 328
    int-to-float v5, v5

    .line 329
    iget v8, v13, Landroid/graphics/Rect;->top:I

    .line 330
    .line 331
    int-to-float v8, v8

    .line 332
    mul-float/2addr v7, v8

    .line 333
    invoke-virtual/range {p1 .. p1}, Lcom/android/launcher3/dragndrop/v;->getBlurSizeOutline()I

    .line 334
    .line 335
    .line 336
    move-result v8

    .line 337
    int-to-float v8, v8

    .line 338
    mul-float/2addr v8, v4

    .line 339
    div-float/2addr v8, v12

    .line 340
    sub-float/2addr v7, v8

    .line 341
    sub-float/2addr v7, v9

    .line 342
    add-float/2addr v5, v7

    .line 343
    float-to-int v5, v5

    .line 344
    invoke-static {}, Lx1/O;->C3()Z

    .line 345
    .line 346
    .line 347
    move-result v7

    .line 348
    if-eqz v7, :cond_5

    .line 349
    .line 350
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 351
    .line 352
    .line 353
    move-result-object v7

    .line 354
    instance-of v7, v7, Lcom/android/launcher3/Hotseat;

    .line 355
    .line 356
    if-eqz v7, :cond_5

    .line 357
    .line 358
    invoke-virtual/range {p1 .. p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 359
    .line 360
    .line 361
    move-result v6

    .line 362
    int-to-float v6, v6

    .line 363
    div-float/2addr v6, v12

    .line 364
    sub-float/2addr v3, v6

    .line 365
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 366
    .line 367
    .line 368
    move-result v6

    .line 369
    :cond_5
    move v3, v5

    .line 370
    move v5, v4

    .line 371
    goto :goto_2

    .line 372
    :cond_6
    move v3, v5

    .line 373
    move v5, v7

    .line 374
    :goto_2
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 375
    .line 376
    .line 377
    new-instance v7, Lcom/android/launcher3/dragndrop/m;

    .line 378
    .line 379
    invoke-direct {v7, v0, v1, v2}, Lcom/android/launcher3/dragndrop/m;-><init>(Lcom/android/launcher3/dragndrop/DragLayer;Landroid/view/View;Lcom/android/launcher3/K5;)V

    .line 380
    .line 381
    .line 382
    const/high16 v4, 0x3f800000    # 1.0f

    .line 383
    .line 384
    const/4 v8, 0x0

    .line 385
    move v2, v6

    .line 386
    move v6, v5

    .line 387
    move-object/from16 v1, p1

    .line 388
    .line 389
    move/from16 v9, p3

    .line 390
    .line 391
    move-object/from16 v10, p4

    .line 392
    .line 393
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/DragLayer;->g(Lcom/android/launcher3/dragndrop/v;IIFFFLjava/lang/Runnable;IILandroid/view/View;)V

    .line 394
    .line 395
    .line 396
    return-void
.end method

.method public i(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/launcher3/dragndrop/DragLayer;->h(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;ILandroid/view/View;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public j(Lcom/android/launcher3/dragndrop/v;[IFFFILjava/lang/Runnable;I)V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v3, p2, v0

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    aget v4, p2, v0

    .line 6
    .line 7
    const/4 v11, 0x0

    .line 8
    move-object v1, p0

    .line 9
    move-object v2, p1

    .line 10
    move v5, p3

    .line 11
    move/from16 v6, p4

    .line 12
    .line 13
    move/from16 v7, p5

    .line 14
    .line 15
    move/from16 v9, p6

    .line 16
    .line 17
    move-object/from16 v8, p7

    .line 18
    .line 19
    move/from16 v10, p8

    .line 20
    .line 21
    invoke-virtual/range {v1 .. v11}, Lcom/android/launcher3/dragndrop/DragLayer;->g(Lcom/android/launcher3/dragndrop/v;IIFFFLjava/lang/Runnable;IILandroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public k()Lcom/android/launcher3/dragndrop/v;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/DragLayer;->h:Lcom/android/launcher3/dragndrop/j;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceTouchListener()Lcom/android/launcher3/touch/J;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/touch/J;->f()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onInterceptHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 17
    .line 18
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v2, v0, Lcom/android/launcher3/folder/Folder;

    .line 25
    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "accessibility"

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/view/accessibility/AccessibilityManager;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_a

    .line 46
    .line 47
    move-object v2, v0

    .line 48
    check-cast v2, Lcom/android/launcher3/folder/Folder;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    const/4 v4, 0x7

    .line 55
    const/4 v5, 0x1

    .line 56
    if-eq v3, v4, :cond_5

    .line 57
    .line 58
    const/16 v4, 0x9

    .line 59
    .line 60
    if-eq v3, v4, :cond_2

    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/DragLayer;->l(Landroid/view/MotionEvent;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getIsEditingName()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/DragLayer;->q(Z)V

    .line 81
    .line 82
    .line 83
    iput-boolean v5, p0, Lcom/android/launcher3/dragndrop/DragLayer;->k:Z

    .line 84
    .line 85
    return v5

    .line 86
    :cond_4
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->k:Z

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_5
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/DragLayer;->l(Landroid/view/MotionEvent;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_6

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_6
    move p1, v1

    .line 103
    goto :goto_2

    .line 104
    :cond_7
    :goto_1
    move p1, v5

    .line 105
    :goto_2
    if-nez p1, :cond_8

    .line 106
    .line 107
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->k:Z

    .line 108
    .line 109
    if-nez v0, :cond_8

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getIsEditingName()Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/DragLayer;->q(Z)V

    .line 116
    .line 117
    .line 118
    iput-boolean v5, p0, Lcom/android/launcher3/dragndrop/DragLayer;->k:Z

    .line 119
    .line 120
    return v5

    .line 121
    :cond_8
    if-nez p1, :cond_9

    .line 122
    .line 123
    return v5

    .line 124
    :cond_9
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->k:Z

    .line 125
    .line 126
    :cond_a
    :goto_3
    return v1
.end method

.method public onRequestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p1, Lcom/android/launcher3/DropTargetBar;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/BaseDragLayer;->onRequestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/android/launcher3/blur/f;->j(Lcom/android/launcher3/C2;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onSetAlpha(I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/h1;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->s()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->P3()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->s()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->P3()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public p(Lcom/android/launcher3/dragndrop/v;Landroid/animation/Animator;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->h:Lcom/android/launcher3/dragndrop/j;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->H()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->j:Lcom/android/launcher3/dragndrop/v;

    .line 22
    .line 23
    iput-object p2, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 24
    .line 25
    new-instance p1, Lcom/android/launcher3/dragndrop/n;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Lcom/android/launcher3/dragndrop/n;-><init>(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p2, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 35
    .line 36
    .line 37
    if-nez p3, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 40
    .line 41
    new-instance p2, Lcom/android/launcher3/dragndrop/o;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Lcom/android/launcher3/dragndrop/o;-><init>(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/DragLayer;->i:Landroid/animation/Animator;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public r(Lcom/android/launcher3/dragndrop/j;Lcom/android/launcher3/Workspace;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/dragndrop/j;",
            "Lcom/android/launcher3/Workspace<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->h:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->recreateControllers()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ln1/s;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ln1/s;-><init>(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/DragLayer;->o:Ln1/s;

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Lcom/android/launcher3/Workspace;->B0(Lz2/a$b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public recreateControllers()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->x1()[Lcom/android/launcher3/util/G2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mControllers:[Lcom/android/launcher3/util/G2;

    .line 10
    .line 11
    return-void
.end method
