.class public Lcom/android/launcher3/folder/FolderIcon;
.super Landroid/widget/FrameLayout;
.source "FolderIcon.java"

# interfaces
.implements Lcom/android/launcher3/views/H;
.implements Lcom/android/launcher3/dragndrop/y;
.implements Lcom/android/launcher3/G5;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/folder/FolderIcon$d;
    }
.end annotation


# static fields
.field protected static final W:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/folder/FolderIcon;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected A:Landroid/animation/Animator;

.field private B:Landroid/graphics/Rect;

.field private C:F

.field D:Lcom/android/launcher3/L4;

.field private E:Z

.field private F:I

.field private G:I

.field private H:I

.field protected I:I

.field public J:I

.field private K:I

.field private L:Landroid/graphics/Paint;

.field private M:Landroid/graphics/RectF;

.field private N:Z

.field private O:I

.field private P:I

.field private Q:I

.field private R:Z

.field S:Lcom/android/launcher3/folder/i0;

.field public T:Lx1/v;

.field private U:I

.field private V:I

.field private final g:Lcom/android/launcher3/util/z1;

.field protected h:Lcom/android/launcher3/views/k;

.field protected i:Lcom/android/launcher3/folder/Folder;

.field public j:Lcom/android/launcher3/model/data/p;

.field protected k:Lcom/android/launcher3/V;

.field public l:Lcom/android/launcher3/BubbleTextView;

.field public m:Lcom/android/launcher3/folder/u0;

.field protected n:Z

.field o:Lcom/android/launcher3/folder/A;

.field p:Lcom/android/launcher3/folder/a;

.field private q:Lcom/android/launcher3/folder/A0;

.field private r:Lcom/android/launcher3/folder/y0;

.field private s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field t:Z

.field protected u:Lcom/android/launcher3/c;

.field public v:Z

.field public w:Lk1/b;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
        deepExport = true
    .end annotation
.end field

.field public x:Ls1/m;

.field public y:Ls1/m$a;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
        deepExport = true
    .end annotation
.end field

.field public z:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/FolderIcon$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "dotScale"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/folder/FolderIcon$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/folder/FolderIcon;->W:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/util/z1;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->g:Lcom/android/launcher3/util/z1;

    .line 10
    .line 11
    new-instance p1, Lcom/android/launcher3/folder/u0;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {p1, p2}, Lcom/android/launcher3/folder/u0;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->n:Z

    .line 24
    .line 25
    new-instance p2, Lcom/android/launcher3/folder/y0;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-direct {p2, v0, v0, v0}, Lcom/android/launcher3/folder/y0;-><init>(FFF)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->r:Lcom/android/launcher3/folder/y0;

    .line 32
    .line 33
    new-instance p2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    iput-boolean p2, p0, Lcom/android/launcher3/folder/FolderIcon;->t:Z

    .line 42
    .line 43
    new-instance v0, Lcom/android/launcher3/c;

    .line 44
    .line 45
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {v0, v1}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 53
    .line 54
    new-instance v0, Lk1/b;

    .line 55
    .line 56
    invoke-direct {v0}, Lk1/b;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 60
    .line 61
    new-instance v0, Landroid/graphics/Rect;

    .line 62
    .line 63
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->B:Landroid/graphics/Rect;

    .line 67
    .line 68
    const/high16 v0, 0x3f800000    # 1.0f

    .line 69
    .line 70
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->C:F

    .line 71
    .line 72
    new-instance v0, Lcom/android/launcher3/folder/FolderIcon$b;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/FolderIcon$b;-><init>(Lcom/android/launcher3/folder/FolderIcon;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->D:Lcom/android/launcher3/L4;

    .line 78
    .line 79
    iput-boolean p2, p0, Lcom/android/launcher3/folder/FolderIcon;->E:Z

    .line 80
    .line 81
    iput p2, p0, Lcom/android/launcher3/folder/FolderIcon;->J:I

    .line 82
    .line 83
    iput p2, p0, Lcom/android/launcher3/folder/FolderIcon;->K:I

    .line 84
    .line 85
    new-instance v0, Landroid/graphics/RectF;

    .line 86
    .line 87
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->M:Landroid/graphics/RectF;

    .line 91
    .line 92
    iput-boolean p2, p0, Lcom/android/launcher3/folder/FolderIcon;->N:Z

    .line 93
    .line 94
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->R:Z

    .line 95
    .line 96
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderIcon;->M()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private A(Lk1/a;)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lk1/a;->d()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iget p0, p0, Lcom/android/launcher3/folder/FolderIcon;->K:I

    .line 10
    .line 11
    add-int/2addr p1, p0

    .line 12
    return p1
.end method

.method public static K(ILandroid/content/Context;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(ITT;",
            "Landroid/view/ViewGroup;",
            "Lcom/android/launcher3/model/data/p;",
            ")",
            "Lcom/android/launcher3/folder/FolderIcon;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->e1(Landroid/content/Context;)Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/folder/FolderIcon;->L(ILcom/android/launcher3/views/k;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/Folder;->setFolderIcon(Lcom/android/launcher3/folder/FolderIcon;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p3}, Lcom/android/launcher3/folder/Folder;->J0(Lcom/android/launcher3/model/data/p;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->setFolder(Lcom/android/launcher3/folder/Folder;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3, v0}, Lcom/android/launcher3/model/data/p;->D(Lcom/android/launcher3/model/data/p$a;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget p2, p2, Lcom/android/launcher3/h0;->Q1:I

    .line 28
    .line 29
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/android/launcher3/F1;->J0:[I

    .line 36
    .line 37
    const/4 p3, 0x0

    .line 38
    aget p1, p1, p3

    .line 39
    .line 40
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/folder/FolderIcon;->O(II)V

    .line 41
    .line 42
    .line 43
    return-object p0
.end method

.method public static L(ILcom/android/launcher3/views/k;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;
    .locals 6

    .line 1
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :goto_0
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, p0, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 28
    .line 29
    .line 30
    const p2, 0x7f0b0280

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 38
    .line 39
    iput-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 40
    .line 41
    iget-object v1, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 47
    .line 48
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 58
    .line 59
    instance-of v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    iget v3, v0, Lcom/android/launcher3/X3;->u0:I

    .line 64
    .line 65
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-static {}, Lm1/a;->a()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    iget v3, v0, Lcom/android/launcher3/h0;->B1:I

    .line 75
    .line 76
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 77
    .line 78
    invoke-static {}, Lm1/a;->b()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_3

    .line 83
    .line 84
    iget v3, v0, Lcom/android/launcher3/h0;->B1:I

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    const v5, 0x7f0704bf

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    sub-int/2addr v3, v4

    .line 102
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    iget v3, v0, Lcom/android/launcher3/h0;->B1:I

    .line 106
    .line 107
    iget v4, v0, Lcom/android/launcher3/h0;->D1:I

    .line 108
    .line 109
    add-int/2addr v3, v4

    .line 110
    iput v3, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 111
    .line 112
    :cond_3
    :goto_1
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iput-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 123
    .line 124
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 125
    .line 126
    iget-object p2, v0, Lcom/android/launcher3/h0;->n3:Ls1/m;

    .line 127
    .line 128
    iput-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->x:Ls1/m;

    .line 129
    .line 130
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 131
    .line 132
    iget v0, v0, Lcom/android/launcher3/h0;->B1:I

    .line 133
    .line 134
    iput v0, p2, Ls1/m$a;->g:I

    .line 135
    .line 136
    iget-object p2, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 137
    .line 138
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/FolderIcon;->x(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->n0()V

    .line 146
    .line 147
    .line 148
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 153
    .line 154
    .line 155
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-static {p1}, Lcom/android/launcher3/folder/A;->b(Lcom/android/launcher3/h0;)Lcom/android/launcher3/folder/A;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->o:Lcom/android/launcher3/folder/A;

    .line 164
    .line 165
    invoke-virtual {p1, p3}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 166
    .line 167
    .line 168
    invoke-direct {p0, v2}, Lcom/android/launcher3/folder/FolderIcon;->r0(Z)V

    .line 169
    .line 170
    .line 171
    if-eqz v1, :cond_4

    .line 172
    .line 173
    move-object p1, p0

    .line 174
    check-cast p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 175
    .line 176
    invoke-virtual {p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->r1()V

    .line 177
    .line 178
    .line 179
    :cond_4
    return-object p0
.end method

.method private M()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/V;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/V;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->k:Lcom/android/launcher3/V;

    .line 7
    .line 8
    sget-object v0, Lf1/a;->D:Lf1/a$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/folder/i0;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/android/launcher3/folder/i0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->S:Lcom/android/launcher3/folder/i0;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v0, Lcom/android/launcher3/folder/a;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/android/launcher3/folder/a;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->p:Lcom/android/launcher3/folder/a;

    .line 30
    .line 31
    :goto_0
    new-instance v0, Lcom/android/launcher3/folder/A0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/A0;-><init>(Lcom/android/launcher3/folder/FolderIcon;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 37
    .line 38
    new-instance v0, Ls1/m$a;

    .line 39
    .line 40
    invoke-direct {v0}, Ls1/m$a;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const v2, 0x7f060808

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iput v1, v0, Ls1/m$a;->a:I

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object v1, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 75
    .line 76
    const/4 v2, 0x1

    .line 77
    const/4 v3, 0x0

    .line 78
    if-ne v0, v1, :cond_1

    .line 79
    .line 80
    move v0, v3

    .line 81
    goto :goto_1

    .line 82
    :cond_1
    move v0, v2

    .line 83
    :goto_1
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->I:I

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->Y:Z

    .line 94
    .line 95
    if-nez v0, :cond_3

    .line 96
    .line 97
    invoke-static {}, Lm1/a;->a()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_2
    move v2, v3

    .line 105
    :cond_3
    :goto_2
    iput-boolean v2, p0, Lcom/android/launcher3/folder/FolderIcon;->N:Z

    .line 106
    .line 107
    if-eqz v2, :cond_4

    .line 108
    .line 109
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderIcon;->N()V

    .line 110
    .line 111
    .line 112
    :cond_4
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private N()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v2

    .line 25
    :goto_0
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->I:I

    .line 26
    .line 27
    new-instance v0, Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->L:Landroid/graphics/Paint;

    .line 33
    .line 34
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->L:Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->L:Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-static {}, Lm1/a;->a()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const v2, 0x7f0600ac

    .line 57
    .line 58
    .line 59
    :goto_1
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_2

    .line 64
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const v2, 0x7f0600ab

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :goto_2
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget v1, v0, Lcom/android/launcher3/X3;->Y:I

    .line 88
    .line 89
    iput v1, p0, Lcom/android/launcher3/folder/FolderIcon;->O:I

    .line 90
    .line 91
    iget v1, v0, Lcom/android/launcher3/X3;->Z:I

    .line 92
    .line 93
    iput v1, p0, Lcom/android/launcher3/folder/FolderIcon;->P:I

    .line 94
    .line 95
    iget v0, v0, Lcom/android/launcher3/X3;->a0:I

    .line 96
    .line 97
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->Q:I

    .line 98
    .line 99
    return-void
.end method

.method private O(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/folder/FolderIcon;->V:I

    .line 4
    .line 5
    int-to-float v0, p1

    .line 6
    sget v1, Lcom/android/launcher3/folder/i0;->m:F

    .line 7
    .line 8
    mul-float/2addr v1, v0

    .line 9
    float-to-int v1, v1

    .line 10
    iput v1, p0, Lcom/android/launcher3/folder/FolderIcon;->F:I

    .line 11
    .line 12
    sget v1, Lcom/android/launcher3/folder/i0;->n:F

    .line 13
    .line 14
    mul-float/2addr v0, v1

    .line 15
    float-to-int v0, v0

    .line 16
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->H:I

    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/folder/FolderIcon;->F:I

    .line 19
    .line 20
    mul-int/2addr v1, p2

    .line 21
    add-int/lit8 p2, p2, -0x1

    .line 22
    .line 23
    mul-int/2addr p2, v0

    .line 24
    add-int/2addr v1, p2

    .line 25
    sub-int/2addr p1, v1

    .line 26
    div-int/lit8 p1, p1, 0x2

    .line 27
    .line 28
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->G:I

    .line 29
    .line 30
    return-void
.end method

.method private P(FF)Z
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    const v2, 0x3da3d70a    # 0.08f

    .line 24
    .line 25
    .line 26
    mul-float/2addr v1, v2

    .line 27
    float-to-int v1, v1

    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-float p0, p0

    .line 33
    mul-float/2addr p0, v2

    .line 34
    float-to-int p0, p0

    .line 35
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    add-int/2addr v2, p0

    .line 38
    int-to-float v2, v2

    .line 39
    cmpg-float v2, p2, v2

    .line 40
    .line 41
    if-gez v2, :cond_0

    .line 42
    .line 43
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 44
    .line 45
    sub-int/2addr v2, p0

    .line 46
    int-to-float p0, v2

    .line 47
    cmpl-float p0, p2, p0

    .line 48
    .line 49
    if-lez p0, :cond_0

    .line 50
    .line 51
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 52
    .line 53
    add-int/2addr p0, v1

    .line 54
    int-to-float p0, p0

    .line 55
    cmpg-float p0, p1, p0

    .line 56
    .line 57
    if-gez p0, :cond_0

    .line 58
    .line 59
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 60
    .line 61
    sub-int/2addr p0, v1

    .line 62
    int-to-float p0, p0

    .line 63
    cmpl-float p0, p1, p0

    .line 64
    .line 65
    if-lez p0, :cond_0

    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_0
    return v3
.end method

.method private synthetic S(ILcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/folder/A0;->p(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/Folder;->j2(Lcom/android/launcher3/model/data/y;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic T(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->l0(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/logging/d;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic U(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/K;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/D;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/android/launcher3/folder/D;-><init>(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/folder/K;Lcom/android/launcher3/n0$a;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p1, 0x190

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1, p2}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private V(Lk1/a;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->A(Lk1/a;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

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

.method private getPushConfigCount()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-static {v3, v2}, Lcom/android/launcher3/nubia/c;->h(Landroid/content/Context;Ljava/lang/Object;)Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return v1
.end method

.method public static synthetic i(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/folder/K;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->T(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/folder/FolderIcon;ILcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->S(ILcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/K;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->U(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/K;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    iget-boolean v0, v0, Lcom/android/launcher3/model/data/y;->isShowAppName:Z

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 49
    .line 50
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 51
    .line 52
    const/16 v2, -0x65

    .line 53
    .line 54
    if-ne v0, v2, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    const/4 v0, 0x1

    .line 61
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/folder/FolderIcon;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->E:Z

    .line 2
    .line 3
    return-void
.end method

.method private p0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/nubia/c;->s(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderIcon;->getPushConfigCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->K:I

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private r0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/A0;->B(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->E(I)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private setFolder(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public B([I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/u0;->B0([I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/A0;->w()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/u0;->A0(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public E(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->o:Lcom/android/launcher3/folder/A;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p1, p0}, Lcom/android/launcher3/folder/A;->j(Lcom/android/launcher3/h0;ILjava/util/List;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public H()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getNotificationCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

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

.method public Q(FF)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderIcon;->N:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->P(FF)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 16
    .line 17
    iget v2, v1, Lcom/android/launcher3/folder/u0;->q:I

    .line 18
    .line 19
    int-to-float v2, v2

    .line 20
    iget v3, v1, Lcom/android/launcher3/folder/u0;->i:F

    .line 21
    .line 22
    mul-float/2addr v2, v3

    .line 23
    float-to-int v2, v2

    .line 24
    int-to-float v3, v2

    .line 25
    const v4, 0x3da3d70a    # 0.08f

    .line 26
    .line 27
    .line 28
    mul-float/2addr v3, v4

    .line 29
    float-to-int v3, v3

    .line 30
    mul-int/lit8 v4, v3, 0x2

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/folder/u0;->F0()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    sub-int/2addr v1, v3

    .line 37
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/folder/u0;->G0()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    sub-int/2addr p0, v3

    .line 44
    add-int v3, v1, v2

    .line 45
    .line 46
    add-int/2addr v3, v4

    .line 47
    add-int/2addr v2, p0

    .line 48
    add-int/2addr v2, v4

    .line 49
    invoke-virtual {v0, v1, p0, v3, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 50
    .line 51
    .line 52
    iget p0, v0, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    int-to-float p0, p0

    .line 55
    cmpg-float p0, p2, p0

    .line 56
    .line 57
    if-gez p0, :cond_1

    .line 58
    .line 59
    iget p0, v0, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    cmpl-float p0, p2, p0

    .line 63
    .line 64
    if-lez p0, :cond_1

    .line 65
    .line 66
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 67
    .line 68
    int-to-float p0, p0

    .line 69
    cmpg-float p0, p1, p0

    .line 70
    .line 71
    if-gez p0, :cond_1

    .line 72
    .line 73
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    int-to-float p0, p0

    .line 76
    cmpl-float p0, p1, p0

    .line 77
    .line 78
    if-lez p0, :cond_1

    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_1
    const/4 p0, 0x0

    .line 83
    return p0
.end method

.method public R(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public W(Lcom/android/launcher3/model/data/y;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->q1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->s0(Lcom/android/launcher3/model/data/y;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lc1/b;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 51
    .line 52
    invoke-virtual {v0}, Lc1/b;->a()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v0}, Lc1/b;->b()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v4, 0x0

    .line 61
    invoke-virtual {v2, v1, v3, v0, v4}, Lcom/android/launcher3/folder/u0;->Y(Lcom/android/launcher3/CellLayout;IILcom/android/launcher3/n0$a;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->D:Lcom/android/launcher3/L4;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 69
    .line 70
    .line 71
    instance-of v0, p1, Lcom/android/launcher3/model/data/F;

    .line 72
    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    instance-of v0, p1, Lcom/android/launcher3/widget/y0;

    .line 76
    .line 77
    if-nez v0, :cond_1

    .line 78
    .line 79
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 86
    .line 87
    const-wide/16 v0, 0x320

    .line 88
    .line 89
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/c;->d(J)V

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_0
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/u0;->a0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->u:Lcom/android/launcher3/c;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Y(Lcom/android/launcher3/n0$a;Z)V
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/model/data/F;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/model/data/F;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_0
    :goto_0
    move-object v3, v0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 20
    .line 21
    instance-of v1, v1, Lcom/android/launcher3/dragndrop/h;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    instance-of v0, v0, Lcom/android/launcher3/model/data/l;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    new-instance v0, Lcom/android/launcher3/model/data/l;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    check-cast v1, Lcom/android/launcher3/model/data/l;

    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/launcher3/model/data/l;-><init>(Lcom/android/launcher3/model/data/l;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 42
    .line 43
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 44
    .line 45
    invoke-direct {v0, v1}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->I1()V

    .line 52
    .line 53
    .line 54
    if-eqz p2, :cond_3

    .line 55
    .line 56
    iget v0, v3, Lcom/android/launcher3/model/data/y;->rank:I

    .line 57
    .line 58
    :goto_2
    move v7, v0

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    goto :goto_2

    .line 71
    :goto_3
    const/4 v5, 0x0

    .line 72
    const/high16 v6, 0x3f800000    # 1.0f

    .line 73
    .line 74
    move-object v2, p0

    .line 75
    move-object v4, p1

    .line 76
    move v8, p2

    .line 77
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/folder/FolderIcon;->Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method protected Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    const/4 v4, -0x1

    .line 10
    iput v4, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 11
    .line 12
    iput v4, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 13
    .line 14
    iget-object v6, v2, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 15
    .line 16
    if-eqz v6, :cond_d

    .line 17
    .line 18
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    instance-of v5, v4, Lcom/android/launcher3/C2;

    .line 21
    .line 22
    if-eqz v5, :cond_d

    .line 23
    .line 24
    check-cast v4, Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const/high16 v7, 0x3f800000    # 1.0f

    .line 31
    .line 32
    if-nez p3, :cond_0

    .line 33
    .line 34
    new-instance v8, Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v4}, Lcom/android/launcher3/Workspace;->V2()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 47
    .line 48
    .line 49
    move-result v9

    .line 50
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 51
    .line 52
    .line 53
    move-result v10

    .line 54
    invoke-virtual {v0, v7}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v7}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, v0, v8}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    invoke-virtual {v0, v9}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v10}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/android/launcher3/Workspace;->Q2()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move-object/from16 v8, p3

    .line 75
    .line 76
    move/from16 v11, p4

    .line 77
    .line 78
    :goto_0
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 79
    .line 80
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iget-object v4, v4, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 85
    .line 86
    iget v4, v4, Lcom/android/launcher3/r4;->U:I

    .line 87
    .line 88
    const/4 v9, 0x1

    .line 89
    const/4 v10, 0x0

    .line 90
    if-nez p6, :cond_1

    .line 91
    .line 92
    sget v12, Lcom/android/launcher3/folder/i0;->k:I

    .line 93
    .line 94
    if-lt v3, v12, :cond_4

    .line 95
    .line 96
    :cond_1
    new-instance v12, Ljava/util/ArrayList;

    .line 97
    .line 98
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 99
    .line 100
    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 104
    .line 105
    .line 106
    move-result-object v13

    .line 107
    invoke-virtual {v13, v1, v3, v10}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V

    .line 108
    .line 109
    .line 110
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v13}, Ljava/util/List;->clear()V

    .line 113
    .line 114
    .line 115
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 116
    .line 117
    invoke-virtual {v0, v10}, Lcom/android/launcher3/folder/FolderIcon;->E(I)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v14

    .line 121
    invoke-interface {v13, v14}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 122
    .line 123
    .line 124
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v12, v13}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v13

    .line 130
    if-nez v13, :cond_3

    .line 131
    .line 132
    iget-object v13, v0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v13, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 135
    .line 136
    .line 137
    move-result v13

    .line 138
    if-ltz v13, :cond_2

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_2
    move v13, v3

    .line 142
    :goto_1
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 143
    .line 144
    invoke-virtual {v3, v13, v9}, Lcom/android/launcher3/folder/A0;->p(IZ)V

    .line 145
    .line 146
    .line 147
    iget-object v3, v0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 148
    .line 149
    iget-object v14, v0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 150
    .line 151
    invoke-virtual {v3, v12, v14, v1}, Lcom/android/launcher3/folder/A0;->s(Ljava/util/List;Ljava/util/List;Lcom/android/launcher3/model/data/y;)V

    .line 152
    .line 153
    .line 154
    move/from16 v16, v9

    .line 155
    .line 156
    move v3, v13

    .line 157
    goto :goto_2

    .line 158
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 159
    .line 160
    .line 161
    move-result-object v12

    .line 162
    filled-new-array {v1}, [Lcom/android/launcher3/model/data/y;

    .line 163
    .line 164
    .line 165
    move-result-object v13

    .line 166
    invoke-virtual {v12, v10, v13}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 167
    .line 168
    .line 169
    :cond_4
    move/from16 v16, v10

    .line 170
    .line 171
    :goto_2
    if-nez v16, :cond_5

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 174
    .line 175
    .line 176
    move-result-object v12

    .line 177
    invoke-virtual {v12, v1, v3, v9}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V

    .line 178
    .line 179
    .line 180
    :cond_5
    const/4 v12, 0x2

    .line 181
    new-array v13, v12, [I

    .line 182
    .line 183
    invoke-virtual {v0, v3, v4, v13}, Lcom/android/launcher3/folder/FolderIcon;->y(II[I)F

    .line 184
    .line 185
    .line 186
    move-result v14

    .line 187
    aget v15, v13, v10

    .line 188
    .line 189
    int-to-float v15, v15

    .line 190
    mul-float/2addr v15, v11

    .line 191
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    .line 192
    .line 193
    .line 194
    move-result v15

    .line 195
    aput v15, v13, v10

    .line 196
    .line 197
    aget v15, v13, v9

    .line 198
    .line 199
    int-to-float v15, v15

    .line 200
    mul-float/2addr v15, v11

    .line 201
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    .line 202
    .line 203
    .line 204
    move-result v15

    .line 205
    aput v15, v13, v9

    .line 206
    .line 207
    aget v10, v13, v10

    .line 208
    .line 209
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 210
    .line 211
    .line 212
    move-result v15

    .line 213
    div-int/2addr v15, v12

    .line 214
    sub-int/2addr v10, v15

    .line 215
    aget v13, v13, v9

    .line 216
    .line 217
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 218
    .line 219
    .line 220
    move-result v15

    .line 221
    div-int/2addr v15, v12

    .line 222
    sub-int/2addr v13, v15

    .line 223
    invoke-virtual {v8, v10, v13}, Landroid/graphics/Rect;->offset(II)V

    .line 224
    .line 225
    .line 226
    iget-object v10, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 227
    .line 228
    check-cast v10, Lcom/android/launcher3/C2;

    .line 229
    .line 230
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 231
    .line 232
    .line 233
    move-result-object v10

    .line 234
    invoke-virtual {v10}, Lcom/android/launcher3/G4;->q()Z

    .line 235
    .line 236
    .line 237
    move-result v10

    .line 238
    if-eqz v10, :cond_6

    .line 239
    .line 240
    iget-object v10, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 241
    .line 242
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 243
    .line 244
    .line 245
    move-result-object v10

    .line 246
    invoke-virtual {v10}, Lcom/android/launcher3/dragndrop/j;->A()Landroid/graphics/Point;

    .line 247
    .line 248
    .line 249
    move-result-object v10

    .line 250
    iget v12, v10, Landroid/graphics/Point;->x:I

    .line 251
    .line 252
    int-to-float v12, v12

    .line 253
    invoke-virtual {v6, v12}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 254
    .line 255
    .line 256
    iget v12, v10, Landroid/graphics/Point;->y:I

    .line 257
    .line 258
    int-to-float v12, v12

    .line 259
    invoke-virtual {v6, v12}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 260
    .line 261
    .line 262
    iget v12, v10, Landroid/graphics/Point;->x:I

    .line 263
    .line 264
    neg-int v12, v12

    .line 265
    iget v10, v10, Landroid/graphics/Point;->y:I

    .line 266
    .line 267
    neg-int v10, v10

    .line 268
    invoke-virtual {v8, v12, v10}, Landroid/graphics/Rect;->offset(II)V

    .line 269
    .line 270
    .line 271
    :cond_6
    sget v10, Lcom/android/launcher3/folder/i0;->k:I

    .line 272
    .line 273
    if-ge v3, v10, :cond_7

    .line 274
    .line 275
    move v10, v7

    .line 276
    goto :goto_3

    .line 277
    :cond_7
    const/4 v10, 0x0

    .line 278
    :goto_3
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 279
    .line 280
    .line 281
    move-result v12

    .line 282
    if-eqz v12, :cond_8

    .line 283
    .line 284
    :goto_4
    move v10, v7

    .line 285
    goto :goto_5

    .line 286
    :cond_8
    sget v12, Lcom/android/launcher3/folder/i0;->k:I

    .line 287
    .line 288
    if-le v4, v12, :cond_9

    .line 289
    .line 290
    rem-int v4, v3, v4

    .line 291
    .line 292
    sget v12, Lcom/android/launcher3/folder/i0;->k:I

    .line 293
    .line 294
    if-ge v4, v12, :cond_9

    .line 295
    .line 296
    goto :goto_4

    .line 297
    :cond_9
    :goto_5
    mul-float/2addr v14, v11

    .line 298
    iget-object v4, v2, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 299
    .line 300
    instance-of v4, v4, Lcom/android/launcher3/allapps/r;

    .line 301
    .line 302
    if-eqz v4, :cond_a

    .line 303
    .line 304
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 305
    .line 306
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    iget v11, v4, Lcom/android/launcher3/h0;->B1:I

    .line 311
    .line 312
    int-to-float v11, v11

    .line 313
    mul-float/2addr v11, v7

    .line 314
    iget v4, v4, Lcom/android/launcher3/h0;->J2:I

    .line 315
    .line 316
    int-to-float v4, v4

    .line 317
    div-float/2addr v11, v4

    .line 318
    mul-float/2addr v14, v11

    .line 319
    :cond_a
    sget-object v12, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 320
    .line 321
    new-instance v13, Lcom/android/launcher3/folder/B;

    .line 322
    .line 323
    invoke-direct {v13, v0, v3, v1}, Lcom/android/launcher3/folder/B;-><init>(Lcom/android/launcher3/folder/FolderIcon;ILcom/android/launcher3/model/data/y;)V

    .line 324
    .line 325
    .line 326
    move v4, v9

    .line 327
    move v9, v14

    .line 328
    const/4 v14, 0x0

    .line 329
    const/4 v15, 0x0

    .line 330
    const/16 v11, 0x190

    .line 331
    .line 332
    move-object v7, v8

    .line 333
    move v8, v10

    .line 334
    move v10, v9

    .line 335
    invoke-virtual/range {v5 .. v15}, Lcom/android/launcher3/dragndrop/DragLayer;->f(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Rect;FFFILandroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 336
    .line 337
    .line 338
    iget-object v5, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 339
    .line 340
    const/16 v6, 0x8

    .line 341
    .line 342
    invoke-virtual {v5, v6}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 343
    .line 344
    .line 345
    move-result v5

    .line 346
    if-nez v5, :cond_b

    .line 347
    .line 348
    iget-object v5, v0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 349
    .line 350
    invoke-virtual {v5, v1}, Lcom/android/launcher3/folder/Folder;->n1(Lcom/android/launcher3/model/data/y;)V

    .line 351
    .line 352
    .line 353
    :cond_b
    if-nez v16, :cond_c

    .line 354
    .line 355
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 356
    .line 357
    invoke-virtual {v1, v3, v4}, Lcom/android/launcher3/folder/A0;->p(IZ)V

    .line 358
    .line 359
    .line 360
    :cond_c
    new-instance v1, Lcom/android/launcher3/folder/K;

    .line 361
    .line 362
    invoke-direct {v1}, Lcom/android/launcher3/folder/K;-><init>()V

    .line 363
    .line 364
    .line 365
    sget-object v3, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 366
    .line 367
    new-instance v4, Lcom/android/launcher3/folder/C;

    .line 368
    .line 369
    invoke-direct {v4, v0, v2, v1}, Lcom/android/launcher3/folder/C;-><init>(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/K;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :cond_d
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 381
    .line 382
    .line 383
    return-void
.end method

.method public a0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/A0;->t(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->r0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->n0()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->x(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->r0(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public c0(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->x(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public cancelLongPress()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->k:Lcom/android/launcher3/V;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->C(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Ljava/util/ArrayList;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Lcom/android/launcher3/n0$a;",
            "Landroid/graphics/Rect;",
            "F)V"
        }
    .end annotation

    .line 1
    iget-object v0, p4, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/FolderIcon;->g0(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 7
    .line 8
    .line 9
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p2, v0, v1}, Lcom/android/launcher3/folder/A0;->j(ZLjava/lang/Runnable;)Lcom/android/launcher3/folder/e0;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Lcom/android/launcher3/folder/e0;->g()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    if-eqz p3, :cond_1

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    move-object v1, p3

    .line 35
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    if-ne p1, v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v5, 0x1

    .line 41
    const/4 v6, 0x0

    .line 42
    move-object v0, p0

    .line 43
    move-object v2, p4

    .line 44
    move-object v3, p5

    .line 45
    move v4, p6

    .line 46
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/folder/FolderIcon;->Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderIcon;->N:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderIcon;->R:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->M:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Lcom/android/launcher3/folder/FolderIcon;->P:I

    .line 16
    .line 17
    add-int/2addr v1, v2

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget v3, p0, Lcom/android/launcher3/folder/FolderIcon;->O:I

    .line 24
    .line 25
    add-int/2addr v2, v3

    .line 26
    int-to-float v2, v2

    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    add-int/2addr v3, v4

    .line 36
    iget v4, p0, Lcom/android/launcher3/folder/FolderIcon;->P:I

    .line 37
    .line 38
    sub-int/2addr v3, v4

    .line 39
    int-to-float v3, v3

    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    add-int/2addr v4, v5

    .line 49
    iget v5, p0, Lcom/android/launcher3/folder/FolderIcon;->O:I

    .line 50
    .line 51
    sub-int/2addr v4, v5

    .line 52
    int-to-float v4, v4

    .line 53
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->M:Landroid/graphics/RectF;

    .line 57
    .line 58
    iget v1, p0, Lcom/android/launcher3/folder/FolderIcon;->Q:I

    .line 59
    .line 60
    int-to-float v2, v1

    .line 61
    int-to-float v1, v1

    .line 62
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->L:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderIcon;->m0()V

    .line 68
    .line 69
    .line 70
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 71
    .line 72
    .line 73
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderIcon;->n:Z

    .line 74
    .line 75
    if-nez v0, :cond_1

    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/android/launcher3/folder/A0;->w()V

    .line 81
    .line 82
    .line 83
    new-instance v0, Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->C(Landroid/graphics/Rect;)V

    .line 89
    .line 90
    .line 91
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 92
    .line 93
    int-to-float v3, v1

    .line 94
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 95
    .line 96
    int-to-float v4, v1

    .line 97
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 98
    .line 99
    int-to-float v5, v1

    .line 100
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 101
    .line 102
    int-to-float v6, v0

    .line 103
    const/4 v7, 0x0

    .line 104
    move-object v2, p1

    .line 105
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/folder/u0;->v0()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_2

    .line 116
    .line 117
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/u0;->q0(Landroid/graphics/Canvas;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 123
    .line 124
    if-nez v0, :cond_3

    .line 125
    .line 126
    invoke-virtual {v2, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->s:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_4

    .line 137
    .line 138
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderIcon;->t:Z

    .line 139
    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    invoke-virtual {v2, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/A0;->k(Landroid/graphics/Canvas;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/folder/u0;->v0()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_5

    .line 158
    .line 159
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 160
    .line 161
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/u0;->r0(Landroid/graphics/Canvas;)V

    .line 162
    .line 163
    .line 164
    :cond_5
    instance-of v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 165
    .line 166
    if-nez v0, :cond_6

    .line 167
    .line 168
    invoke-virtual {p0, v2}, Lcom/android/launcher3/folder/FolderIcon;->w(Landroid/graphics/Canvas;)V

    .line 169
    .line 170
    .line 171
    :cond_6
    invoke-virtual {v2, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    instance-of v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    move-object v0, p0

    .line 20
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->h1(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/folder/FolderIcon;->Q(FF)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_0
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->T:Lx1/v;

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-instance v0, Lx1/v;

    .line 48
    .line 49
    const-string v2, "FolderIcon"

    .line 50
    .line 51
    invoke-direct {v0, p0, v2, v1}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->T:Lx1/v;

    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->T:Lx1/v;

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0
.end method

.method public e0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V
    .locals 7

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/FolderIcon;->g0(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p2, p1}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p2, v0, v1}, Lcom/android/launcher3/folder/A0;->j(ZLjava/lang/Runnable;)Lcom/android/launcher3/folder/e0;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/folder/e0;->g()V

    .line 20
    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    const/4 v6, 0x0

    .line 24
    move-object v0, p0

    .line 25
    move-object v1, p3

    .line 26
    move-object v2, p4

    .line 27
    move-object v3, p5

    .line 28
    move v4, p6

    .line 29
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/folder/FolderIcon;->Z(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;FIZ)V

    .line 30
    .line 31
    .line 32
    iget-object p0, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->a0()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    iget-object p0, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->o()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    const-string p0, "FolderIcon"

    .line 65
    .line 66
    const-string p2, "performCreateAnimation removeDraggingViewIfNecessary"

    .line 67
    .line 68
    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    iget-object p0, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, p1}, Lcom/android/launcher3/G4;->A(Lcom/android/launcher3/model/data/y;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public f0(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/A0;->o()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "FolderIcon"

    .line 14
    .line 15
    const-string v0, "performDestroyAnimation: FirstPageParams is Empty!"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/folder/A0;->j(ZLjava/lang/Runnable;)Lcom/android/launcher3/folder/e0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/folder/e0;->g()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public g0(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/A0;->v(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getBackgroundStrokeWidth()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/u0;->M0()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFolder()Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFolderBackground()Lcom/android/launcher3/folder/u0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFolderName()Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconVisible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/FolderIcon;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLayoutRule()Lcom/android/launcher3/folder/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->p:Lcom/android/launcher3/folder/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->S:Lcom/android/launcher3/folder/i0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNotificationCount()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lk1/b;->d()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v2}, Lcom/android/launcher3/nubia/c;->s(Landroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    return v0

    .line 23
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_4

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {v4, v3}, Lcom/android/launcher3/nubia/c;->h(Landroid/content/Context;Ljava/lang/Object;)Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 62
    .line 63
    invoke-interface {v4, v3}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    invoke-virtual {v3}, Lk1/a;->d()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    move v3, v1

    .line 75
    :goto_2
    sub-int/2addr v0, v3

    .line 76
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    return p0
.end method

.method public getPrepareToSetAlarm()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/FolderIcon;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPreviewItemManager()Lcom/android/launcher3/folder/A0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReorderBounceScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/FolderIcon;->C:F

    .line 2
    .line 3
    return p0
.end method

.method public getTextVisible()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

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

.method public getTranslateDelegate()Lcom/android/launcher3/util/z1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->g:Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    return-object p0
.end method

.method public getViewType()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h0(Lcom/android/launcher3/model/data/y;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p2, 0x0

    .line 6
    filled-new-array {p1}, [Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/p;->N(Lcom/android/launcher3/model/data/p$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j0()V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v0, v0, Lcom/android/launcher3/h0;->Q1:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v0, v1, v1}, Lcom/android/launcher3/folder/FolderIcon;->k0(III)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public k0(III)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

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
    iget v0, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 9
    .line 10
    if-eq v0, p1, :cond_2

    .line 11
    .line 12
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 15
    .line 16
    iput p1, v0, Ls1/m$a;->g:I

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    sub-int/2addr p3, p1

    .line 23
    div-int/lit8 p3, p3, 0x2

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-virtual {p0, p1, p3, p2, p3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget p1, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 37
    .line 38
    iget p2, p0, Lcom/android/launcher3/folder/FolderIcon;->V:I

    .line 39
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->O(II)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 44
    .line 45
    iget p2, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/android/launcher3/folder/A0;->y(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 51
    .line 52
    .line 53
    :cond_2
    :goto_0
    return-void
.end method

.method public l0(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/logging/d;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->I()Lcom/android/launcher3/model/data/p$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/model/data/p$b;->h:Lcom/android/launcher3/model/data/p$b;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eqz p1, :cond_3

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/folder/K;->f()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/K;->e()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 49
    .line 50
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->t:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 55
    .line 56
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/folder/K;->c()[Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/4 v0, 0x0

    .line 65
    aget-object p1, p1, v0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->H()Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, p1, v2}, Lcom/android/launcher3/model/data/p;->Q(Ljava/lang/CharSequence;Lz1/J3;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 89
    .line 90
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderIcon;->c0(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getFolderName()Lcom/android/launcher3/folder/FolderNameEditText;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static {v1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-interface {v1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 123
    .line 124
    invoke-interface {p2, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withFromState(Lcom/android/launcher3/logger/LauncherAtom$FromState;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    sget-object p2, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION0:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 133
    .line 134
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withToState(Lcom/android/launcher3/logger/LauncherAtom$ToState;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withEditText(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->s:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 147
    .line 148
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_3
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 169
    .line 170
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->u:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 175
    .line 176
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public n0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lk1/b;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 8
    .line 9
    invoke-virtual {v1}, Lk1/b;->k()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget-object v5, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 47
    .line 48
    invoke-interface {v5, v2}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v3, v4, v2}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 57
    .line 58
    invoke-virtual {v1}, Lk1/b;->j()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    const/high16 v2, 0x3f800000    # 1.0f

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    const/4 v2, 0x0

    .line 68
    :goto_1
    xor-int/2addr v0, v1

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isShown()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    const/4 v0, 0x1

    .line 78
    new-array v0, v0, [F

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    aput v2, v0, v1

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->s([F)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->t()V

    .line 88
    .line 89
    .line 90
    iput v2, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public o(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->q1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->s0(Lcom/android/launcher3/model/data/y;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method protected o0(ZZ)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    xor-int/2addr p1, p2

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isShown()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    new-array p1, p1, [F

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    aput v0, p1, p2

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->s([F)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->t()V

    .line 27
    .line 28
    .line 29
    iput v0, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onHoverChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onHoverChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/u0;->X0(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->F1:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/android/launcher3/h0;->B1:I

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/2addr v0, v2

    .line 36
    iget v2, v1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 37
    .line 38
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 39
    .line 40
    sub-float/2addr v2, v1

    .line 41
    float-to-double v1, v2

    .line 42
    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    double-to-int v1, v1

    .line 47
    add-int/2addr v0, v1

    .line 48
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    sub-int/2addr v2, v0

    .line 57
    div-int/lit8 v2, v2, 0x2

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-virtual {p0, v1, v2, v0, v3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 68
    .line 69
    .line 70
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lx1/O;->C3()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iget v0, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 94
    .line 95
    sub-int v0, p2, v0

    .line 96
    .line 97
    div-int/lit8 v0, v0, 0x2

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {p0, v1, v0, v2, v0}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 111
    .line 112
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 117
    .line 118
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-static {v1}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-static {v0, v1}, Lp1/f;->i(Lcom/android/launcher3/C2;I)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget v1, p0, Lcom/android/launcher3/folder/FolderIcon;->U:I

    .line 131
    .line 132
    if-eq v1, v0, :cond_1

    .line 133
    .line 134
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->k0(III)V

    .line 135
    .line 136
    .line 137
    :cond_1
    invoke-static {}, Lm1/a;->a()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_2

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    const v1, 0x7f0703ea

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    add-int/2addr p2, v0

    .line 163
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 172
    .line 173
    .line 174
    :cond_2
    invoke-static {}, Lm1/a;->b()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_3

    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    const v0, 0x7f0704bf

    .line 189
    .line 190
    .line 191
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 204
    .line 205
    .line 206
    :cond_3
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/folder/FolderIcon;->Q(FF)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eq p1, v1, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x3

    .line 23
    if-eq p1, v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->cancelLongPress()V

    .line 27
    .line 28
    .line 29
    :goto_0
    const-string p0, "FolderIcon"

    .line 30
    .line 31
    const-string p1, "onTouchEvent is not touch icon area"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->k:Lcom/android/launcher3/V;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V;->h(Landroid/view/MotionEvent;)V

    .line 44
    .line 45
    .line 46
    return v1
.end method

.method public p(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(ZZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/launcher3/r4;->U:I

    .line 10
    .line 11
    if-eqz p3, :cond_1

    .line 12
    .line 13
    iget-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 16
    .line 17
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x1

    .line 34
    sub-int/2addr p3, v2

    .line 35
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    check-cast p3, Lcom/android/launcher3/model/data/y;

    .line 40
    .line 41
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    if-eqz p3, :cond_0

    .line 46
    .line 47
    const-string v1, "theme.folder.add"

    .line 48
    .line 49
    invoke-virtual {p3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    if-eqz p3, :cond_0

    .line 58
    .line 59
    const/4 v2, 0x2

    .line 60
    :cond_0
    iget-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 61
    .line 62
    iget-object p3, p3, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 63
    .line 64
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    sub-int/2addr p3, v2

    .line 73
    if-ge p3, v0, :cond_1

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object p3, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 77
    .line 78
    iget-object p3, p3, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 79
    .line 80
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    div-int/2addr p3, v0

    .line 89
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/folder/A0;->f(ZZI)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public q0(Ljava/util/function/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/A0;->A(Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public varargs s([F)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s([F)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->t()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/folder/FolderIcon;->W:Landroid/util/Property;

    .line 15
    .line 16
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->A:Landroid/animation/Animator;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/folder/FolderIcon$c;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/FolderIcon$c;-><init>(Lcom/android/launcher3/folder/FolderIcon;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->A:Landroid/animation/Animator;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method protected s0(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/model/data/p;->R(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 10
    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->i:Lcom/android/launcher3/folder/Folder;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

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

.method public setAlarmOpenFolder(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->E:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDotInfo(Lk1/b;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->V(Lk1/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->H()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/folder/FolderIcon;->o0(ZZ)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->A(Lk1/a;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-lez p1, :cond_0

    .line 21
    .line 22
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->J:I

    .line 23
    .line 24
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderIcon;->p0()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v1, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    const/4 v3, 0x0

    .line 47
    if-ne p1, v1, :cond_1

    .line 48
    .line 49
    move p1, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move p1, v2

    .line 52
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->R0()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move v1, v3

    .line 68
    :goto_1
    if-eqz v1, :cond_3

    .line 69
    .line 70
    move v1, v3

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getNotificationCount()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    :goto_2
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->I:I

    .line 77
    .line 78
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->V(Lk1/a;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-lez v1, :cond_4

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_4
    move v2, v3

    .line 86
    :goto_3
    invoke-virtual {p0, p1, v2}, Lcom/android/launcher3/folder/FolderIcon;->o0(ZZ)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public setFolderBackground(Lcom/android/launcher3/folder/u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/u0;->Y0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setForceHideDot(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderIcon;->v:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->v:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->H()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    const/4 p1, 0x2

    .line 21
    new-array p1, p1, [F

    .line 22
    .line 23
    fill-array-data p1, :array_0

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->s([F)V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void

    .line 30
    nop

    .line 31
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setIconSize(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0}, Lcom/android/launcher3/folder/FolderIcon;->k0(III)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setIconVisible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->n:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setNeedShowClipBoard(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderIcon;->R:Z

    .line 2
    .line 3
    return-void
.end method

.method public setReorderBounceScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/FolderIcon;->C:F

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTextVisible(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    const/4 p1, 0x4

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method protected t()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->A:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/folder/FolderIcon$d;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon$d;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Lcom/android/launcher3/folder/FolderIcon$d;->a(Lcom/android/launcher3/folder/FolderIcon;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/A0;->D(Landroid/graphics/drawable/Drawable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

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

.method public w(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/folder/FolderIcon;->v:Z

    .line 6
    .line 7
    if-nez v1, :cond_5

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 13
    .line 14
    cmpl-float v0, v0, v1

    .line 15
    .line 16
    if-lez v0, :cond_5

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 37
    .line 38
    if-ne v2, v3, :cond_1

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 v2, 0x1

    .line 43
    :goto_0
    iput v2, v0, Ls1/m$a;->i:I

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/folder/u0;->F0()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/android/launcher3/folder/u0;->G0()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 58
    .line 59
    iget v4, v3, Lcom/android/launcher3/folder/u0;->q:I

    .line 60
    .line 61
    int-to-float v4, v4

    .line 62
    iget v3, v3, Lcom/android/launcher3/folder/u0;->i:F

    .line 63
    .line 64
    mul-float/2addr v4, v3

    .line 65
    float-to-int v3, v4

    .line 66
    iget-object v4, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 67
    .line 68
    iget-object v4, v4, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 69
    .line 70
    add-int v5, v0, v3

    .line 71
    .line 72
    add-int/2addr v3, v2

    .line 73
    invoke-virtual {v4, v0, v2, v5, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 77
    .line 78
    iget v2, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 79
    .line 80
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 81
    .line 82
    invoke-virtual {v3}, Lcom/android/launcher3/folder/u0;->w0()F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    sub-float/2addr v2, v3

    .line 87
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    iput v1, v0, Ls1/m$a;->d:F

    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->w:Lk1/b;

    .line 94
    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 98
    .line 99
    iget v1, p0, Lcom/android/launcher3/folder/FolderIcon;->z:F

    .line 100
    .line 101
    const/high16 v2, 0x3f800000    # 1.0f

    .line 102
    .line 103
    invoke-static {v1, v2}, Ljava/lang/Float;->compare(FF)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getNotificationCount()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    iget v1, p0, Lcom/android/launcher3/folder/FolderIcon;->J:I

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getNotificationCount()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    :goto_1
    iput v1, v0, Ls1/m$a;->f:I

    .line 125
    .line 126
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget v1, v1, Lcom/android/launcher3/r4;->V:F

    .line 141
    .line 142
    iput v1, v0, Ls1/m$a;->j:F

    .line 143
    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v1, "drawDot: "

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 155
    .line 156
    iget v1, v1, Ls1/m$a;->f:I

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const-string v1, "FolderIcon"

    .line 166
    .line 167
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 171
    .line 172
    iget v0, v0, Ls1/m$a;->d:F

    .line 173
    .line 174
    invoke-static {}, Lx1/O;->C3()Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_4

    .line 179
    .line 180
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_4

    .line 185
    .line 186
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 187
    .line 188
    iget v1, v1, Ls1/m$a;->d:F

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getIconSize()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    int-to-float v2, v2

    .line 195
    mul-float/2addr v1, v2

    .line 196
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v2, v3}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-static {v2}, Lp1/f;->a(Lcom/android/launcher3/h0;)I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    int-to-float v2, v2

    .line 217
    div-float/2addr v1, v2

    .line 218
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 219
    .line 220
    float-to-double v3, v1

    .line 221
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 222
    .line 223
    .line 224
    move-result-wide v3

    .line 225
    double-to-float v1, v3

    .line 226
    iput v1, v2, Ls1/m$a;->d:F

    .line 227
    .line 228
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->x:Ls1/m;

    .line 229
    .line 230
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 235
    .line 236
    invoke-virtual {v1, v2, p1, v3}, Ls1/m;->a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V

    .line 237
    .line 238
    .line 239
    invoke-static {}, Lx1/O;->C3()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_5

    .line 244
    .line 245
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_5

    .line 250
    .line 251
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->y:Ls1/m$a;

    .line 252
    .line 253
    iput v0, p0, Ls1/m$a;->d:F

    .line 254
    .line 255
    :cond_5
    return-void
.end method

.method public x(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const v0, 0x7f14046e

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget v1, Lcom/android/launcher3/folder/i0;->k:I

    .line 25
    .line 26
    if-ge v0, v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const v0, 0x7f1401a9

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget v0, Lcom/android/launcher3/folder/i0;->k:I

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const v0, 0x7f1401aa

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method protected y(II[I)F
    .locals 2

    .line 1
    rem-int/2addr p1, p2

    .line 2
    sget v0, Lcom/android/launcher3/folder/i0;->k:I

    .line 3
    .line 4
    if-ge p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget p1, Lcom/android/launcher3/folder/i0;->k:I

    .line 8
    .line 9
    div-int/lit8 p1, p1, 0x2

    .line 10
    .line 11
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->q:Lcom/android/launcher3/folder/A0;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderIcon;->r:Lcom/android/launcher3/folder/y0;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2, v1}, Lcom/android/launcher3/folder/A0;->i(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderIcon;->r:Lcom/android/launcher3/folder/y0;

    .line 20
    .line 21
    iget p2, p1, Lcom/android/launcher3/folder/y0;->b:F

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 24
    .line 25
    iget v1, v0, Lcom/android/launcher3/folder/u0;->r:I

    .line 26
    .line 27
    int-to-float v1, v1

    .line 28
    add-float/2addr p2, v1

    .line 29
    iput p2, p1, Lcom/android/launcher3/folder/y0;->b:F

    .line 30
    .line 31
    iget v1, p1, Lcom/android/launcher3/folder/y0;->c:F

    .line 32
    .line 33
    iget v0, v0, Lcom/android/launcher3/folder/u0;->s:I

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    add-float/2addr v1, v0

    .line 37
    iput v1, p1, Lcom/android/launcher3/folder/y0;->c:F

    .line 38
    .line 39
    iget p1, p0, Lcom/android/launcher3/folder/FolderIcon;->F:I

    .line 40
    .line 41
    div-int/lit8 v0, p1, 0x2

    .line 42
    .line 43
    int-to-float v0, v0

    .line 44
    add-float/2addr p2, v0

    .line 45
    div-int/lit8 p1, p1, 0x2

    .line 46
    .line 47
    int-to-float p1, p1

    .line 48
    add-float/2addr v1, p1

    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    aput p2, p3, p1

    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    aput p2, p3, p1

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->r:Lcom/android/launcher3/folder/y0;

    .line 64
    .line 65
    iget p0, p0, Lcom/android/launcher3/folder/y0;->d:F

    .line 66
    .line 67
    return p0
.end method
