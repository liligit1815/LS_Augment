.class public Lcom/android/launcher3/folder/Folder;
.super Lcom/android/launcher3/a;
.source "Folder.java"

# interfaces
.implements Lcom/android/launcher3/views/u;
.implements Lcom/android/launcher3/m0;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/launcher3/n0;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Lcom/android/launcher3/ExtendedEditText$a;
.implements Lcom/android/launcher3/util/Y0;
.implements Lcom/android/launcher3/model/data/p$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/folder/Folder$k;,
        Lcom/android/launcher3/folder/Folder$o;,
        Lcom/android/launcher3/folder/Folder$m;,
        Lcom/android/launcher3/folder/Folder$l;,
        Lcom/android/launcher3/folder/Folder$n;
    }
.end annotation


# static fields
.field private static final F0:Ljava/lang/CharSequence;

.field private static final G0:Landroid/graphics/Rect;

.field public static final H0:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private static I0:Landroid/animation/AnimatorSet;


# instance fields
.field A:I

.field private A0:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

.field private B:Landroid/graphics/Path;

.field private B0:Landroid/view/View;

.field private C:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
        mapping = {
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x0
                to = "STATE_CLOSED"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x1
                to = "STATE_ANIMATING"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x2
                to = "STATE_OPEN"
            .end subannotation
        }
    .end annotation
.end field

.field private final C0:[I

.field private final D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/folder/Folder$m;",
            ">;"
        }
    .end annotation
.end field

.field private D0:Lcom/android/launcher3/folder/B0;

.field private E:Lcom/android/launcher3/folder/Folder$m;

.field private E0:Z

.field private F:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private G:Z

.field private H:Landroid/view/View;

.field private I:Z

.field private J:Z

.field private K:Z

.field private L:Z

.field private M:Z

.field private N:Z

.field private O:Z

.field private P:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private Q:I

.field private R:I

.field S:I

.field private T:Lcom/android/launcher3/logging/StatsLogManager;

.field private U:Lcom/android/launcher3/anim/M;

.field private final V:Landroid/graphics/drawable/GradientDrawable;

.field W:Lcom/android/launcher3/L4;

.field a0:Lcom/android/launcher3/L4;

.field private b0:F

.field private c0:F

.field private d0:Landroid/text/TextWatcher;

.field private e0:Lcom/android/launcher3/globalsearch/r$b;

.field private f0:Lcom/android/launcher3/cloudfolder/a;

.field private g:Lcom/android/launcher3/c;

.field private g0:J

.field private h:Lcom/android/launcher3/c;

.field public h0:Lcom/android/launcher3/folder/Folder$k;

.field private i:Lcom/android/launcher3/c;

.field protected i0:Lcom/android/launcher3/folder/Folder$l;

.field private j:Lcom/android/launcher3/c;

.field protected j0:Landroid/graphics/Bitmap;

.field final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field protected k0:I

.field private l:Landroid/animation/AnimatorSet;

.field private l0:Z

.field private m:Z

.field private m0:Landroid/graphics/drawable/Drawable;

.field public n:Lcom/android/launcher3/folder/g0;

.field private n0:Landroid/graphics/drawable/Drawable;

.field public final o:Lcom/android/launcher3/views/k;

.field private o0:Ljava/lang/String;

.field protected p:Lcom/android/launcher3/dragndrop/j;

.field p0:Landroid/view/View;

.field public q:Lcom/android/launcher3/model/data/p;

.field private q0:Landroid/widget/LinearLayout;

.field private r:Ljava/lang/CharSequence;

.field r0:F

.field private s:Lcom/android/launcher3/logger/LauncherAtom$FromState;

.field s0:F

.field t:Lcom/android/launcher3/folder/FolderIcon;

.field public t0:F

.field u:Lcom/android/launcher3/folder/FolderPagedView;

.field public u0:F

.field public v:Lcom/android/launcher3/folder/FolderNameEditText;

.field v0:F

.field public w:Landroid/view/View;

.field w0:F

.field private x:I

.field public x0:Z

.field y:I

.field private y0:Z

.field z:I

.field private z0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "~"

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/folder/Folder;->F0:Ljava/lang/CharSequence;

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/folder/Folder;->G0:Landroid/graphics/Rect;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/folder/Folder$j;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/android/launcher3/folder/Folder$j;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/folder/Folder;->H0:Ljava/util/Comparator;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Lcom/android/launcher3/c;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p2, v0}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 14
    .line 15
    new-instance p2, Lcom/android/launcher3/c;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p2, v0}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 25
    .line 26
    new-instance p2, Lcom/android/launcher3/c;

    .line 27
    .line 28
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {p2, v0}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 36
    .line 37
    new-instance p2, Lcom/android/launcher3/c;

    .line 38
    .line 39
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-direct {p2, v0}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 44
    .line 45
    .line 46
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 47
    .line 48
    new-instance p2, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder;->k:Ljava/util/ArrayList;

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->m:Z

    .line 57
    .line 58
    iput p2, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 59
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->D:Ljava/util/List;

    .line 66
    .line 67
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 68
    .line 69
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 70
    .line 71
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 72
    .line 73
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 74
    .line 75
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->L:Z

    .line 76
    .line 77
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->M:Z

    .line 78
    .line 79
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 80
    .line 81
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 82
    .line 83
    const/4 v0, -0x1

    .line 84
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 85
    .line 86
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->S:I

    .line 87
    .line 88
    new-instance v1, Lcom/android/launcher3/folder/Folder$g;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/Folder$g;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 91
    .line 92
    .line 93
    iput-object v1, p0, Lcom/android/launcher3/folder/Folder;->W:Lcom/android/launcher3/L4;

    .line 94
    .line 95
    new-instance v1, Lcom/android/launcher3/folder/Folder$h;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/Folder$h;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 98
    .line 99
    .line 100
    iput-object v1, p0, Lcom/android/launcher3/folder/Folder;->a0:Lcom/android/launcher3/L4;

    .line 101
    .line 102
    new-instance v1, Lcom/android/launcher3/folder/Folder$a;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/Folder$a;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 105
    .line 106
    .line 107
    iput-object v1, p0, Lcom/android/launcher3/folder/Folder;->d0:Landroid/text/TextWatcher;

    .line 108
    .line 109
    const-wide/16 v1, 0x0

    .line 110
    .line 111
    iput-wide v1, p0, Lcom/android/launcher3/folder/Folder;->g0:J

    .line 112
    .line 113
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->k0:I

    .line 114
    .line 115
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->l0:Z

    .line 116
    .line 117
    const/4 v0, 0x0

    .line 118
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 119
    .line 120
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 121
    .line 122
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 123
    .line 124
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 125
    .line 126
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->y0:Z

    .line 127
    .line 128
    const/4 v0, 0x0

    .line 129
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->B0:Landroid/view/View;

    .line 130
    .line 131
    const/4 v0, 0x2

    .line 132
    new-array v0, v0, [I

    .line 133
    .line 134
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->C0:[I

    .line 135
    .line 136
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->E0:Z

    .line 137
    .line 138
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 139
    .line 140
    .line 141
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 146
    .line 147
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 148
    .line 149
    invoke-static {v0}, Lcom/android/launcher3/folder/g0;->d(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/g0;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 154
    .line 155
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->T:Lcom/android/launcher3/logging/StatsLogManager;

    .line 160
    .line 161
    const/4 p1, 0x1

    .line 162
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    .line 163
    .line 164
    .line 165
    invoke-static {}, Lx1/O;->k1()Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-eqz p1, :cond_0

    .line 170
    .line 171
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setDefaultFocusHighlightEnabled(Z)V

    .line 172
    .line 173
    .line 174
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    invoke-virtual {p2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    const v0, 0x7f0811a7

    .line 187
    .line 188
    .line 189
    invoke-static {p1, v0, p2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 197
    .line 198
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->V:Landroid/graphics/drawable/GradientDrawable;

    .line 199
    .line 200
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method private synthetic A1(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->k:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder;->B0:Landroid/view/View;

    .line 14
    .line 15
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private synthetic B1(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    filled-new-array {p1}, [Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic C1(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic D1(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/folder/FolderIcon;->Y(Lcom/android/launcher3/n0$a;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic E1(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->l1(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/FolderPagedView;->r0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic F1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    return p0
.end method

.method private G0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->b0()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lx1/O;->e2()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->N0()V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->X0()Landroid/animation/AnimatorSet;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Lcom/android/launcher3/folder/Folder$f;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/Folder$f;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/Folder;->x0(Landroid/animation/AnimatorSet;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private synthetic G1(Ljava/util/ArrayList;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/K;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/folder/K;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Lcom/android/launcher3/folder/FolderNameProvider;->o(Landroid/content/Context;)Lcom/android/launcher3/folder/FolderNameProvider;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2, p1, v0}, Lcom/android/launcher3/folder/FolderNameProvider;->j(Landroid/content/Context;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 24
    .line 25
    return-void
.end method

.method private H0(Ljava/util/List;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->g2(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {}, Lx1/O;->e2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/Folder;->T0(Lcom/android/launcher3/folder/Folder;)Z

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->N0()V

    .line 25
    .line 26
    .line 27
    const-string v0, "Launcher.Folder"

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    if-eqz p2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/android/launcher3/folder/Folder;->getState()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-ne v2, v1, :cond_2

    .line 37
    .line 38
    const-string p0, "click more folder at the same time"

    .line 39
    .line 40
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    if-eqz p2, :cond_3

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->h2()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_3

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/android/launcher3/folder/Folder;->getState()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    const/4 v2, 0x2

    .line 57
    if-ne p2, v2, :cond_3

    .line 58
    .line 59
    const-string p0, "drag to open folder, the second open return"

    .line 60
    .line 61
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 66
    .line 67
    const/16 v2, 0x100

    .line 68
    .line 69
    invoke-static {p2, v2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const/4 v3, 0x0

    .line 74
    if-eqz p2, :cond_4

    .line 75
    .line 76
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-static {p2, v2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2, v3}, Lcom/android/launcher3/a;->close(Z)V

    .line 83
    .line 84
    .line 85
    :cond_4
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->D0:Lcom/android/launcher3/folder/B0;

    .line 86
    .line 87
    if-eqz p2, :cond_5

    .line 88
    .line 89
    invoke-virtual {p2}, Lcom/android/launcher3/folder/B0;->g()V

    .line 90
    .line 91
    .line 92
    :cond_5
    invoke-direct {p0, v1}, Lcom/android/launcher3/folder/Folder;->Q0(Z)V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lx1/O;->e2()Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_6

    .line 100
    .line 101
    sget-object p2, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 102
    .line 103
    new-instance v2, Lcom/android/launcher3/folder/b;

    .line 104
    .line 105
    invoke-direct {v2}, Lcom/android/launcher3/folder/b;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    :cond_6
    sget-object p2, Lf1/a;->D:Lf1/a$a;

    .line 112
    .line 113
    invoke-virtual {p2}, Lf1/a$a;->c()Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_7

    .line 118
    .line 119
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 120
    .line 121
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderIcon;->getPrepareToSetAlarm()Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-nez p2, :cond_7

    .line 126
    .line 127
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->S1(Ljava/util/List;)Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    :cond_7
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Lcom/android/launcher3/folder/FolderPagedView;->Y(Ljava/util/List;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 137
    .line 138
    invoke-virtual {p1, v1}, Lcom/android/launcher3/folder/FolderPagedView;->setCanAnnouncePageDescriptionForFolder(Z)V

    .line 139
    .line 140
    .line 141
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->s2()V

    .line 144
    .line 145
    .line 146
    iput-boolean v1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 147
    .line 148
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 149
    .line 150
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    if-nez p2, :cond_8

    .line 159
    .line 160
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p1, p0}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 168
    .line 169
    .line 170
    :cond_8
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->o1()Lcom/android/launcher3/folder/Folder$k;

    .line 171
    .line 172
    .line 173
    new-instance p1, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .line 177
    .line 178
    const-string p2, "animateOpen: content child count before: "

    .line 179
    .line 180
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 184
    .line 185
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderPagedView;->getTotalChildCount()I

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    const-string p2, "b/383526431"

    .line 197
    .line 198
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->b0()V

    .line 204
    .line 205
    .line 206
    iget-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 207
    .line 208
    if-nez p1, :cond_9

    .line 209
    .line 210
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 211
    .line 212
    invoke-virtual {p1, v3}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 213
    .line 214
    .line 215
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .line 219
    .line 220
    const-string v2, "animateOpen: content child count after pending page changes: "

    .line 221
    .line 222
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/android/launcher3/folder/FolderPagedView;->getTotalChildCount()I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    iput-boolean v3, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 242
    .line 243
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->O0()V

    .line 244
    .line 245
    .line 246
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->h2()Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    if-nez p1, :cond_a

    .line 251
    .line 252
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->N1()V

    .line 253
    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_a
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->Z0()Landroid/animation/AnimatorSet;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    new-instance v2, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 263
    .line 264
    .line 265
    const-string v3, "animateOpen: content child count after cancelling animation: "

    .line 266
    .line 267
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 271
    .line 272
    invoke-virtual {v3}, Lcom/android/launcher3/folder/FolderPagedView;->getTotalChildCount()I

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    new-instance p2, Lcom/android/launcher3/folder/Folder$e;

    .line 287
    .line 288
    invoke-direct {p2, p0}, Lcom/android/launcher3/folder/Folder$e;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 292
    .line 293
    .line 294
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->x0(Landroid/animation/AnimatorSet;)V

    .line 295
    .line 296
    .line 297
    const-string p2, "b/311077782"

    .line 298
    .line 299
    const-string v2, "Folder.animateOpen"

    .line 300
    .line 301
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    .line 303
    .line 304
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 305
    .line 306
    .line 307
    move-result-object p2

    .line 308
    invoke-static {p2}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 309
    .line 310
    .line 311
    move-result p2

    .line 312
    int-to-long v2, p2

    .line 313
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->getTotalDuration()J

    .line 314
    .line 315
    .line 316
    move-result-wide v4

    .line 317
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 318
    .line 319
    .line 320
    move-result-wide v2

    .line 321
    invoke-virtual {p1, v2, v3}, Landroid/animation/AnimatorSet;->setCurrentPlayTime(J)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 325
    .line 326
    .line 327
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    if-eqz p1, :cond_b

    .line 336
    .line 337
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->v()V

    .line 342
    .line 343
    .line 344
    :cond_b
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 345
    .line 346
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 347
    .line 348
    .line 349
    move-result p2

    .line 350
    invoke-virtual {p1, p2}, Lcom/android/launcher3/folder/FolderPagedView;->w0(I)V

    .line 351
    .line 352
    .line 353
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 354
    .line 355
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 364
    .line 365
    if-eqz p1, :cond_d

    .line 366
    .line 367
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 368
    .line 369
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 370
    .line 371
    .line 372
    move-result-object p1

    .line 373
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    invoke-virtual {p1}, Lcom/android/launcher3/q4;->a0()Z

    .line 378
    .line 379
    .line 380
    move-result p1

    .line 381
    if-eqz p1, :cond_d

    .line 382
    .line 383
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 384
    .line 385
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p1}, Lcom/android/launcher3/q4;->O()Z

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    if-eqz p1, :cond_d

    .line 398
    .line 399
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 400
    .line 401
    .line 402
    move-result-object p1

    .line 403
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    :cond_c
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 408
    .line 409
    .line 410
    move-result p2

    .line 411
    if-eqz p2, :cond_d

    .line 412
    .line 413
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object p2

    .line 417
    check-cast p2, Landroid/view/View;

    .line 418
    .line 419
    instance-of v2, p2, Lcom/android/launcher3/BubbleTextView;

    .line 420
    .line 421
    if-eqz v2, :cond_c

    .line 422
    .line 423
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 424
    .line 425
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 426
    .line 427
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 428
    .line 429
    .line 430
    move-result-object v2

    .line 431
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    invoke-virtual {v2, p2}, Lcom/android/launcher3/G4;->y(Lcom/android/launcher3/BubbleTextView;)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v2

    .line 442
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 443
    .line 444
    iput-boolean v1, v2, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 445
    .line 446
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 447
    .line 448
    invoke-virtual {v3}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 449
    .line 450
    .line 451
    move-result-object v3

    .line 452
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 453
    .line 454
    .line 455
    move-result-object v3

    .line 456
    invoke-virtual {v3, v2}, Lcom/android/launcher3/G4;->n(Lcom/android/launcher3/model/data/I;)Z

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    iput-boolean v3, v2, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 461
    .line 462
    invoke-virtual {p2}, Landroid/widget/TextView;->invalidate()V

    .line 463
    .line 464
    .line 465
    goto :goto_1

    .line 466
    :cond_d
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 467
    .line 468
    const/16 p2, 0x20

    .line 469
    .line 470
    invoke-virtual {p1, p2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 471
    .line 472
    .line 473
    move-result p1

    .line 474
    if-eqz p1, :cond_e

    .line 475
    .line 476
    const-string p1, "private-folder open, ban screenshots."

    .line 477
    .line 478
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    .line 480
    .line 481
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 482
    .line 483
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 484
    .line 485
    .line 486
    move-result-object p0

    .line 487
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 488
    .line 489
    .line 490
    move-result-object p0

    .line 491
    const/16 p1, 0x2000

    .line 492
    .line 493
    invoke-virtual {p0, p1}, Landroid/view/Window;->addFlags(I)V

    .line 494
    .line 495
    .line 496
    :cond_e
    :goto_2
    return-void
.end method

.method private H1(Lcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/view/View;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v1}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/menu/c;->d(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/Folder;)V

    .line 66
    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 70
    .line 71
    iget-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 77
    .line 78
    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 79
    .line 80
    return-void
.end method

.method private J1(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->x0:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 16
    .line 17
    iget p1, p1, Lcom/android/launcher3/r4;->U:I

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getItemCount()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    rem-int/2addr v0, p1

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderPagedView;->getItemCount()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-ne v0, v1, :cond_0

    .line 37
    .line 38
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x1

    .line 41
    .line 42
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getItemCount()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    rem-int/2addr v0, p1

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getItemCount()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-ne p1, v0, :cond_1

    .line 63
    .line 64
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 65
    .line 66
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method private K0(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->p1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 10
    .line 11
    iget v1, p1, Lcom/android/launcher3/model/data/p;->j:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-lt v1, v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Lcom/android/launcher3/cloudfolder/a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/android/launcher3/cloudfolder/a;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 44
    .line 45
    const/4 v0, 0x2

    .line 46
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    new-instance p1, Lcom/android/launcher3/folder/B0;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Lcom/android/launcher3/folder/B0;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->D0:Lcom/android/launcher3/folder/B0;

    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method private K1()V
    .locals 4

    .line 1
    const v0, 0x7f0b027d

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/Folder;->setFolderBackground(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const v2, 0x7f140176

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const v2, 0x7f080986

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->n0:Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const v2, 0x7f080b22

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->m0:Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 63
    .line 64
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    const v0, 0x7f0b0281

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroid/widget/LinearLayout;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->q0:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    const v0, 0x7f0b0461

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    instance-of v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 98
    .line 99
    if-eqz v2, :cond_1

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 112
    .line 113
    invoke-virtual {v3}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 122
    .line 123
    if-eqz v3, :cond_0

    .line 124
    .line 125
    const v3, 0x7f0c0084

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    const v3, 0x7f0c0083

    .line 130
    .line 131
    .line 132
    :goto_0
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    int-to-float v2, v2

    .line 137
    invoke-static {v2}, Lcom/android/launcher3/N5;->i(F)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 142
    .line 143
    invoke-static {}, Lx1/O;->k1()Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-eqz v2, :cond_1

    .line 148
    .line 149
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 150
    .line 151
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 152
    .line 153
    const-string v2, "sans-serif-medium"

    .line 154
    .line 155
    invoke-static {v2, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 160
    .line 161
    .line 162
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_3

    .line 171
    .line 172
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    const v3, 0x7f070355

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 186
    .line 187
    .line 188
    :cond_3
    invoke-static {}, Lx1/O;->k1()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_4

    .line 193
    .line 194
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Landroid/view/View;->setDefaultFocusHighlightEnabled(Z)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 200
    .line 201
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setDefaultFocusHighlightEnabled(Z)V

    .line 202
    .line 203
    .line 204
    :cond_4
    return-void
.end method

.method private L1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "mOriginFolderName: "

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "Launcher.Folder"

    .line 60
    .line 61
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method private M1(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-ne p1, v1, :cond_5

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    float-to-int p1, p1

    .line 14
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    float-to-int p2, p2

    .line 19
    new-instance v2, Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 25
    .line 26
    invoke-virtual {v3, v2}, Landroid/widget/EditText;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const v4, 0x7f070354

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 41
    .line 42
    invoke-virtual {v4}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-eqz v4, :cond_0

    .line 47
    .line 48
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 49
    .line 50
    invoke-virtual {v4}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4, v0}, Landroid/text/Layout;->getLineWidth(I)F

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    float-to-int v4, v4

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move v4, v0

    .line 61
    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/widget/EditText;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    sub-int/2addr v4, v3

    .line 72
    div-int/lit8 v4, v4, 0x2

    .line 73
    .line 74
    iget v5, v2, Landroid/graphics/Rect;->left:I

    .line 75
    .line 76
    add-int/2addr v4, v5

    .line 77
    add-int/2addr v3, v4

    .line 78
    iget-boolean v5, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 79
    .line 80
    if-nez v5, :cond_2

    .line 81
    .line 82
    if-lt p1, v4, :cond_1

    .line 83
    .line 84
    if-le p1, v3, :cond_2

    .line 85
    .line 86
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 87
    .line 88
    .line 89
    return v1

    .line 90
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 91
    .line 92
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->m0:Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    iget v1, v2, Landroid/graphics/Rect;->right:I

    .line 98
    .line 99
    add-int/lit8 v1, v1, -0x46

    .line 100
    .line 101
    iput v1, v2, Landroid/graphics/Rect;->left:I

    .line 102
    .line 103
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    const/4 p2, 0x0

    .line 108
    if-eqz p1, :cond_4

    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 113
    .line 114
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_3

    .line 119
    .line 120
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 123
    .line 124
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    if-eqz p1, :cond_3

    .line 129
    .line 130
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 131
    .line 132
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 133
    .line 134
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_3

    .line 147
    .line 148
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 149
    .line 150
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 151
    .line 152
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 157
    .line 158
    new-instance p1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v1, "DeleteFolderName--mOriginFolderName: "

    .line 164
    .line 165
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    const-string v1, "Launcher.Folder"

    .line 178
    .line 179
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 183
    .line 184
    const-string v1, ""

    .line 185
    .line 186
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 190
    .line 191
    invoke-virtual {p0, p2, p2, p2, p2}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 192
    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 196
    .line 197
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n0:Landroid/graphics/drawable/Drawable;

    .line 198
    .line 199
    invoke-virtual {p1, p2, p2, p0, p2}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 200
    .line 201
    .line 202
    :cond_5
    :goto_1
    return v0
.end method

.method public static synthetic N(Lcom/android/launcher3/folder/Folder;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->F1(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private N0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    sput-object p0, Lcom/android/launcher3/folder/Folder;->I0:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    return-void
.end method

.method private N1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->B0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderPagedView;->t0()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/16 v2, 0x30

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTranslationX(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->e2()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic O(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/Folder;->x1(Landroid/animation/AnimatorSet;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private O0()V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/folder/Folder;->P0(Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderWidth()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 29
    .line 30
    sget-object v5, Lcom/android/launcher3/folder/Folder;->G0:Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {v1, v4, v5}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 33
    .line 34
    .line 35
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    div-int/lit8 v6, v2, 0x2

    .line 44
    .line 45
    sub-int/2addr v1, v6

    .line 46
    div-int/lit8 v7, v3, 0x2

    .line 47
    .line 48
    sub-int/2addr v4, v7

    .line 49
    iget-object v8, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 50
    .line 51
    invoke-interface {v8}, Lcom/android/launcher3/views/k;->getFolderBoundingBox()Landroid/graphics/Rect;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    invoke-virtual {v5, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 56
    .line 57
    .line 58
    iget v8, v5, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    iget v9, v5, Landroid/graphics/Rect;->right:I

    .line 61
    .line 62
    sub-int/2addr v9, v2

    .line 63
    invoke-static {v1, v8, v9}, Lcom/android/launcher3/N5;->c(III)I

    .line 64
    .line 65
    .line 66
    move-result v8

    .line 67
    iget v9, v5, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    iget v10, v5, Landroid/graphics/Rect;->bottom:I

    .line 70
    .line 71
    sub-int/2addr v10, v3

    .line 72
    invoke-static {v4, v9, v10}, Lcom/android/launcher3/N5;->c(III)I

    .line 73
    .line 74
    .line 75
    move-result v9

    .line 76
    filled-new-array {v8, v9}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    iget-object v9, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 81
    .line 82
    invoke-interface {v9, v8, v5, v2, v3}, Lcom/android/launcher3/views/k;->updateOpenFolderPosition([ILandroid/graphics/Rect;II)V

    .line 83
    .line 84
    .line 85
    const/4 v5, 0x0

    .line 86
    aget v9, v8, v5

    .line 87
    .line 88
    const/4 v10, 0x1

    .line 89
    aget v8, v8, v10

    .line 90
    .line 91
    sub-int/2addr v1, v9

    .line 92
    add-int/2addr v6, v1

    .line 93
    sub-int/2addr v4, v8

    .line 94
    add-int/2addr v7, v4

    .line 95
    int-to-float v1, v6

    .line 96
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 97
    .line 98
    .line 99
    int-to-float v1, v7

    .line 100
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 101
    .line 102
    .line 103
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 104
    .line 105
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 106
    .line 107
    iput v9, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 108
    .line 109
    iput v8, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 110
    .line 111
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->V:Landroid/graphics/drawable/GradientDrawable;

    .line 112
    .line 113
    invoke-virtual {p0, v5, v5, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method private O1(Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->V1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    instance-of v0, p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 21
    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->g0:Z

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x100

    .line 44
    .line 45
    invoke-static {p1, p0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    move-object v0, p1

    .line 52
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_3

    .line 71
    .line 72
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    :cond_3
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/high16 v0, 0x3f800000    # 1.0f

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 101
    .line 102
    .line 103
    :cond_4
    return-void
.end method

.method private P0(Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;)Z
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const v2, 0x7f040781

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 26
    .line 27
    const/16 v2, 0x20

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 37
    .line 38
    const/16 v3, 0x8

    .line 39
    .line 40
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    const v1, 0x7f0b0499

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/view/ViewGroup;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    const v1, 0x7f0b049a

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Landroid/widget/TextView;

    .line 63
    .line 64
    const v3, 0x7f0b0498

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Landroid/widget/ImageView;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 77
    .line 78
    invoke-virtual {v3, v0, v1}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 84
    .line 85
    invoke-virtual {v3}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getForeColor()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    const/4 v4, 0x1

    .line 94
    const/4 v5, -0x1

    .line 95
    if-ne v5, v3, :cond_1

    .line 96
    .line 97
    move v3, v4

    .line 98
    goto :goto_0

    .line 99
    :cond_1
    move v3, v2

    .line 100
    :goto_0
    invoke-static {v1, v3}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n0:Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->m0:Landroid/graphics/drawable/Drawable;

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/FolderPagedView;->setMfvPageIndicatorColor(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 119
    .line 120
    if-eqz v0, :cond_2

    .line 121
    .line 122
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-interface {v0, p0, p1, p2, v1}, Lcom/android/launcher3/folder/Folder$k;->d(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;Lcom/android/launcher3/h0;)V

    .line 133
    .line 134
    .line 135
    return v4

    .line 136
    :cond_2
    sget-object v0, Lf1/a;->D:Lf1/a$a;

    .line 137
    .line 138
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_5

    .line 143
    .line 144
    const/high16 v0, 0x3f800000    # 1.0f

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    add-int/2addr v1, v2

    .line 161
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 162
    .line 163
    invoke-virtual {v2}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    add-int/2addr v1, v2

    .line 168
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 173
    .line 174
    sget-object v5, Lcom/android/launcher3/folder/Folder;->G0:Landroid/graphics/Rect;

    .line 175
    .line 176
    invoke-virtual {p1, v3, v5}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 177
    .line 178
    .line 179
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    div-int/lit8 v6, v1, 0x2

    .line 188
    .line 189
    sub-int/2addr v3, v6

    .line 190
    div-int/lit8 v7, v2, 0x2

    .line 191
    .line 192
    sub-int/2addr v5, v7

    .line 193
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 194
    .line 195
    .line 196
    move-result v8

    .line 197
    sub-int/2addr v8, v1

    .line 198
    div-int/lit8 v8, v8, 0x2

    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 201
    .line 202
    .line 203
    move-result v9

    .line 204
    iget v10, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 205
    .line 206
    sub-int v11, v2, v10

    .line 207
    .line 208
    sub-int/2addr v9, v11

    .line 209
    div-int/lit8 v9, v9, 0x2

    .line 210
    .line 211
    sub-int/2addr v9, v10

    .line 212
    iget-object v10, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 213
    .line 214
    invoke-virtual {v10}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 215
    .line 216
    .line 217
    move-result-object v10

    .line 218
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 219
    .line 220
    .line 221
    move-result-object v10

    .line 222
    invoke-virtual {v10}, Lcom/android/launcher3/h0;->T0()Z

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    if-eqz v10, :cond_3

    .line 227
    .line 228
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    sub-int/2addr p1, v2

    .line 233
    div-int/lit8 v9, p1, 0x2

    .line 234
    .line 235
    :cond_3
    sub-int/2addr v3, v8

    .line 236
    add-int/2addr v6, v3

    .line 237
    sub-int/2addr v5, v9

    .line 238
    add-int/2addr v7, v5

    .line 239
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->W0()V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    int-to-float p1, p1

    .line 249
    int-to-float v3, v6

    .line 250
    mul-float/2addr v3, v0

    .line 251
    int-to-float v5, v1

    .line 252
    div-float/2addr v3, v5

    .line 253
    mul-float/2addr p1, v3

    .line 254
    float-to-int p1, p1

    .line 255
    int-to-float p1, p1

    .line 256
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->r0:F

    .line 257
    .line 258
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 259
    .line 260
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    int-to-float p1, p1

    .line 265
    int-to-float v3, v7

    .line 266
    mul-float/2addr v3, v0

    .line 267
    int-to-float v0, v2

    .line 268
    div-float/2addr v3, v0

    .line 269
    mul-float/2addr p1, v3

    .line 270
    float-to-int p1, p1

    .line 271
    int-to-float p1, p1

    .line 272
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->s0:F

    .line 273
    .line 274
    iput v8, p2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 275
    .line 276
    iput v9, p2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 277
    .line 278
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 279
    .line 280
    iput v2, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 281
    .line 282
    iput v9, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 283
    .line 284
    iput v8, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 285
    .line 286
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 287
    .line 288
    .line 289
    move-result p1

    .line 290
    if-eqz p1, :cond_4

    .line 291
    .line 292
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 301
    .line 302
    sub-int/2addr p1, v2

    .line 303
    div-int/lit8 p1, p1, 0x2

    .line 304
    .line 305
    iput p1, p2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 306
    .line 307
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 308
    .line 309
    .line 310
    :cond_4
    return v4

    .line 311
    :cond_5
    return v2
.end method

.method private P1(Landroid/view/View;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->u2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Lcom/android/launcher3/folder/Folder;->g0:J

    .line 24
    .line 25
    sub-long v2, v0, v2

    .line 26
    .line 27
    const-wide/16 v4, 0x7d0

    .line 28
    .line 29
    cmp-long v2, v2, v4

    .line 30
    .line 31
    if-lez v2, :cond_0

    .line 32
    .line 33
    iput-wide v0, p0, Lcom/android/launcher3/folder/Folder;->g0:J

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->g0()V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->d1(Landroid/view/View;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0
.end method

.method public static synthetic Q(Lcom/android/launcher3/folder/Folder;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->z1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q0(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/touch/v;->b:Landroid/view/View$OnClickListener;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/folder/d;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/d;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->d0:Landroid/text/TextWatcher;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 28
    .line 29
    new-instance v0, Lcom/android/launcher3/folder/e;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/e;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/ViewGroup;->hasOnClickListeners()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const/4 v0, 0x0

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->d0:Landroid/text/TextWatcher;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/view/View;->hasOnClickListeners()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method public static synthetic R(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->y1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->B1(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private S1(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->Y0()Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method public static synthetic T(I)[Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    new-array p0, p0, [Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U(I)[Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    new-array p0, p0, [Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method private U0(Z)V
    .locals 10

    .line 1
    const/4 p1, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/q4;->a0()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/E2;->d(Landroid/content/Context;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 83
    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->z()Lcom/android/launcher3/statemanager/a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 108
    .line 109
    if-ne v1, v4, :cond_1

    .line 110
    .line 111
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    sget-object v4, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 126
    .line 127
    if-ne v1, v4, :cond_1

    .line 128
    .line 129
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 130
    .line 131
    instance-of v1, v1, Lcom/android/launcher3/folder/G;

    .line 132
    .line 133
    if-nez v1, :cond_2

    .line 134
    .line 135
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 136
    .line 137
    invoke-interface {v1, p0}, Lcom/android/launcher3/folder/Folder$k;->a(Lcom/android/launcher3/folder/Folder;)V

    .line 138
    .line 139
    .line 140
    :cond_2
    iput-object v3, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 141
    .line 142
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    const v4, 0x7f0b022d

    .line 149
    .line 150
    .line 151
    invoke-virtual {v1, v4}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    check-cast v1, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 156
    .line 157
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 158
    .line 159
    if-eqz v4, :cond_4

    .line 160
    .line 161
    if-eqz v1, :cond_4

    .line 162
    .line 163
    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 164
    .line 165
    .line 166
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 167
    .line 168
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 169
    .line 170
    .line 171
    iput-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 172
    .line 173
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->j0:Landroid/graphics/Bitmap;

    .line 174
    .line 175
    invoke-static {v4}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 176
    .line 177
    .line 178
    :cond_4
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->k0:I

    .line 179
    .line 180
    const/4 v5, -0x1

    .line 181
    const-string v6, "Launcher.Folder"

    .line 182
    .line 183
    if-eq v4, v5, :cond_5

    .line 184
    .line 185
    if-eqz v1, :cond_5

    .line 186
    .line 187
    const v4, 0x7f0b0230

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    iget v5, p0, Lcom/android/launcher3/folder/Folder;->k0:I

    .line 198
    .line 199
    invoke-virtual {v1, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 200
    .line 201
    .line 202
    new-instance v5, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    const-string v7, "dropTargetBar--index: "

    .line 208
    .line 209
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    :cond_5
    sget-object v1, Lf1/a;->D:Lf1/a$a;

    .line 227
    .line 228
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    const/high16 v4, 0x3f800000    # 1.0f

    .line 233
    .line 234
    if-eqz v1, :cond_8

    .line 235
    .line 236
    invoke-static {}, Lx1/O;->e2()Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    if-eqz v1, :cond_8

    .line 241
    .line 242
    invoke-static {}, Lx1/O;->d2()Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_8

    .line 247
    .line 248
    invoke-static {}, Lx1/O;->q2()Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    if-eqz v1, :cond_7

    .line 253
    .line 254
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 255
    .line 256
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 265
    .line 266
    invoke-virtual {v5}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 275
    .line 276
    .line 277
    move-result-object v7

    .line 278
    iget-object v8, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 279
    .line 280
    invoke-virtual {v8}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 281
    .line 282
    .line 283
    move-result-object v8

    .line 284
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 285
    .line 286
    .line 287
    move-result-object v8

    .line 288
    new-instance v9, LT0/p$h;

    .line 289
    .line 290
    invoke-direct {v9, v2}, LT0/p$h;-><init>(F)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v9, v1, v2}, LT0/p$h;->b(Landroid/view/View;F)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v9, v5, v2}, LT0/p$h;->b(Landroid/view/View;F)V

    .line 297
    .line 298
    .line 299
    if-eqz v7, :cond_6

    .line 300
    .line 301
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->k0()Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-nez v1, :cond_6

    .line 310
    .line 311
    invoke-virtual {v9, v7, v2}, LT0/p$h;->b(Landroid/view/View;F)V

    .line 312
    .line 313
    .line 314
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 315
    .line 316
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 325
    .line 326
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->k:Z

    .line 327
    .line 328
    if-eqz v1, :cond_7

    .line 329
    .line 330
    invoke-virtual {v9, v8, v2}, LT0/p$h;->b(Landroid/view/View;F)V

    .line 331
    .line 332
    .line 333
    :cond_7
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 334
    .line 335
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    instance-of v5, v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 340
    .line 341
    if-eqz v5, :cond_8

    .line 342
    .line 343
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 344
    .line 345
    invoke-static {}, Lx1/O;->N1()Z

    .line 346
    .line 347
    .line 348
    move-result v5

    .line 349
    if-eqz v5, :cond_8

    .line 350
    .line 351
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->R2()Z

    .line 352
    .line 353
    .line 354
    move-result v5

    .line 355
    if-nez v5, :cond_8

    .line 356
    .line 357
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 358
    .line 359
    .line 360
    move-result-object v1

    .line 361
    new-instance v5, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;

    .line 362
    .line 363
    invoke-direct {v5, v2, v4}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;-><init>(FF)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v5, v0}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->setZoom(Z)V

    .line 367
    .line 368
    .line 369
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    invoke-virtual {v5, v1, v2}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 374
    .line 375
    .line 376
    :cond_8
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 377
    .line 378
    if-eqz v1, :cond_10

    .line 379
    .line 380
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/FolderIcon;->setAlarmOpenFolder(Z)V

    .line 381
    .line 382
    .line 383
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 384
    .line 385
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    if-eqz v1, :cond_9

    .line 390
    .line 391
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 392
    .line 393
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    const/16 v2, 0xff

    .line 398
    .line 399
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 400
    .line 401
    .line 402
    :cond_9
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 403
    .line 404
    iget-object v1, v1, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 405
    .line 406
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 407
    .line 408
    .line 409
    invoke-static {}, Lx1/O;->e2()Z

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    if-eqz v1, :cond_10

    .line 414
    .line 415
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 416
    .line 417
    instance-of v2, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 418
    .line 419
    if-eqz v2, :cond_e

    .line 420
    .line 421
    check-cast v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 422
    .line 423
    iget-object v2, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 424
    .line 425
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 426
    .line 427
    .line 428
    invoke-virtual {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 429
    .line 430
    .line 431
    move-result-object v2

    .line 432
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 433
    .line 434
    .line 435
    move-result-object v2

    .line 436
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    if-eqz v5, :cond_a

    .line 441
    .line 442
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object v5

    .line 446
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 447
    .line 448
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v5}, Landroid/widget/TextView;->invalidate()V

    .line 452
    .line 453
    .line 454
    goto :goto_0

    .line 455
    :cond_a
    invoke-virtual {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getBigChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 460
    .line 461
    .line 462
    move-result-object v2

    .line 463
    :cond_b
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 464
    .line 465
    .line 466
    move-result v5

    .line 467
    if-eqz v5, :cond_d

    .line 468
    .line 469
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object v5

    .line 473
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 474
    .line 475
    invoke-virtual {v5}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 476
    .line 477
    .line 478
    move-result v7

    .line 479
    if-eqz v7, :cond_c

    .line 480
    .line 481
    invoke-virtual {v5, v0}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 482
    .line 483
    .line 484
    :cond_c
    invoke-virtual {v5}, Lcom/android/launcher3/BubbleTextView;->k0()Z

    .line 485
    .line 486
    .line 487
    move-result v7

    .line 488
    if-eqz v7, :cond_b

    .line 489
    .line 490
    invoke-virtual {v5, v0}, Lcom/android/launcher3/BubbleTextView;->setForceHideDownloadMark(Z)V

    .line 491
    .line 492
    .line 493
    goto :goto_1

    .line 494
    :cond_d
    iget-object v2, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 495
    .line 496
    if-eqz v2, :cond_e

    .line 497
    .line 498
    invoke-virtual {v1, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setForceHideDot(Z)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->H()Z

    .line 502
    .line 503
    .line 504
    move-result v2

    .line 505
    if-eqz v2, :cond_e

    .line 506
    .line 507
    iget-object v1, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 508
    .line 509
    new-array v2, p1, [F

    .line 510
    .line 511
    aput v4, v2, v0

    .line 512
    .line 513
    invoke-virtual {v1, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->a([F)V

    .line 514
    .line 515
    .line 516
    :cond_e
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 517
    .line 518
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 519
    .line 520
    .line 521
    move-result-object v1

    .line 522
    if-eqz v1, :cond_f

    .line 523
    .line 524
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 525
    .line 526
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 527
    .line 528
    .line 529
    move-result-object v1

    .line 530
    invoke-virtual {v1, v3}, Lcom/android/launcher3/C2;->w4(Landroid/animation/AnimatorSet;)V

    .line 531
    .line 532
    .line 533
    :cond_f
    invoke-static {}, Lx1/O;->q2()Z

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    if-eqz v1, :cond_10

    .line 538
    .line 539
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getRightCellLayout()Lcom/android/launcher3/CellLayout;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    new-instance v2, Lcom/android/launcher3/folder/f;

    .line 544
    .line 545
    invoke-direct {v2}, Lcom/android/launcher3/folder/f;-><init>()V

    .line 546
    .line 547
    .line 548
    invoke-static {v1, v2}, Lcom/android/launcher3/Workspace;->h2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)V

    .line 549
    .line 550
    .line 551
    :cond_10
    sget-object v1, Lf1/a;->D:Lf1/a$a;

    .line 552
    .line 553
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 554
    .line 555
    .line 556
    move-result v1

    .line 557
    if-eqz v1, :cond_15

    .line 558
    .line 559
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 560
    .line 561
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    if-nez v1, :cond_15

    .line 566
    .line 567
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 568
    .line 569
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 570
    .line 571
    .line 572
    move-result-object v1

    .line 573
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 574
    .line 575
    .line 576
    move-result-object v1

    .line 577
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 578
    .line 579
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 580
    .line 581
    .line 582
    move-result-object v2

    .line 583
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 584
    .line 585
    .line 586
    move-result-object v2

    .line 587
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 588
    .line 589
    invoke-virtual {v5}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 590
    .line 591
    .line 592
    move-result-object v5

    .line 593
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 594
    .line 595
    .line 596
    move-result-object v5

    .line 597
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 598
    .line 599
    .line 600
    move-result-object v5

    .line 601
    iget-object v7, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 602
    .line 603
    invoke-virtual {v7}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 604
    .line 605
    .line 606
    move-result-object v7

    .line 607
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 608
    .line 609
    .line 610
    move-result-object v7

    .line 611
    iget-object v8, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 612
    .line 613
    invoke-virtual {v8}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 614
    .line 615
    .line 616
    move-result-object v8

    .line 617
    sget-object v9, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 618
    .line 619
    invoke-interface {v8, v9}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 620
    .line 621
    .line 622
    move-result v8

    .line 623
    if-nez v8, :cond_13

    .line 624
    .line 625
    invoke-direct {p0, v1}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 626
    .line 627
    .line 628
    invoke-direct {p0, v1}, Lcom/android/launcher3/folder/Folder;->b2(Landroid/view/View;)V

    .line 629
    .line 630
    .line 631
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 632
    .line 633
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 634
    .line 635
    .line 636
    move-result-object v1

    .line 637
    sget-object v8, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 638
    .line 639
    invoke-interface {v1, v8}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 640
    .line 641
    .line 642
    move-result v1

    .line 643
    if-nez v1, :cond_11

    .line 644
    .line 645
    invoke-direct {p0, v2}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 646
    .line 647
    .line 648
    :cond_11
    invoke-direct {p0, v2}, Lcom/android/launcher3/folder/Folder;->b2(Landroid/view/View;)V

    .line 649
    .line 650
    .line 651
    if-eqz v5, :cond_12

    .line 652
    .line 653
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 654
    .line 655
    .line 656
    move-result-object v1

    .line 657
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->k0()Z

    .line 658
    .line 659
    .line 660
    move-result v1

    .line 661
    if-nez v1, :cond_12

    .line 662
    .line 663
    invoke-direct {p0, v5}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 664
    .line 665
    .line 666
    invoke-direct {p0, v5}, Lcom/android/launcher3/folder/Folder;->b2(Landroid/view/View;)V

    .line 667
    .line 668
    .line 669
    :cond_12
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 670
    .line 671
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 672
    .line 673
    .line 674
    move-result-object v1

    .line 675
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 676
    .line 677
    .line 678
    move-result-object v1

    .line 679
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 680
    .line 681
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->k:Z

    .line 682
    .line 683
    if-eqz v1, :cond_15

    .line 684
    .line 685
    invoke-direct {p0, v7}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 686
    .line 687
    .line 688
    invoke-direct {p0, v7}, Lcom/android/launcher3/folder/Folder;->b2(Landroid/view/View;)V

    .line 689
    .line 690
    .line 691
    goto :goto_2

    .line 692
    :cond_13
    invoke-direct {p0, v1}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 693
    .line 694
    .line 695
    invoke-direct {p0, v2}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 696
    .line 697
    .line 698
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->k0()Z

    .line 703
    .line 704
    .line 705
    move-result v1

    .line 706
    if-nez v1, :cond_14

    .line 707
    .line 708
    invoke-direct {p0, v5}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 709
    .line 710
    .line 711
    :cond_14
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 712
    .line 713
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 714
    .line 715
    .line 716
    move-result-object v1

    .line 717
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 718
    .line 719
    .line 720
    move-result-object v1

    .line 721
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 722
    .line 723
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->k:Z

    .line 724
    .line 725
    if-eqz v1, :cond_15

    .line 726
    .line 727
    invoke-direct {p0, v7}, Lcom/android/launcher3/folder/Folder;->a2(Landroid/view/View;)V

    .line 728
    .line 729
    .line 730
    :cond_15
    :goto_2
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 731
    .line 732
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 733
    .line 734
    .line 735
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 736
    .line 737
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 738
    .line 739
    .line 740
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->l0:Z

    .line 741
    .line 742
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 743
    .line 744
    if-eqz v1, :cond_16

    .line 745
    .line 746
    invoke-virtual {v1}, Lcom/android/launcher3/cloudfolder/a;->l()V

    .line 747
    .line 748
    .line 749
    :cond_16
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->D0:Lcom/android/launcher3/folder/B0;

    .line 750
    .line 751
    if-eqz v1, :cond_17

    .line 752
    .line 753
    invoke-virtual {v1}, Lcom/android/launcher3/folder/B0;->e()V

    .line 754
    .line 755
    .line 756
    :cond_17
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/Folder;->Q0(Z)V

    .line 757
    .line 758
    .line 759
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 760
    .line 761
    if-eqz v1, :cond_18

    .line 762
    .line 763
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 764
    .line 765
    .line 766
    move-result-object v1

    .line 767
    if-eqz v1, :cond_18

    .line 768
    .line 769
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 770
    .line 771
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 772
    .line 773
    .line 774
    move-result-object v1

    .line 775
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 776
    .line 777
    .line 778
    :cond_18
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->h2()Z

    .line 779
    .line 780
    .line 781
    move-result v1

    .line 782
    if-nez v1, :cond_19

    .line 783
    .line 784
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 785
    .line 786
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 787
    .line 788
    .line 789
    move-result-object v1

    .line 790
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 791
    .line 792
    .line 793
    move-result-object v2

    .line 794
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 795
    .line 796
    .line 797
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 798
    .line 799
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 800
    .line 801
    .line 802
    move-result v2

    .line 803
    if-nez v2, :cond_19

    .line 804
    .line 805
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 806
    .line 807
    .line 808
    move-result-object v1

    .line 809
    invoke-virtual {v1, v4}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 810
    .line 811
    .line 812
    :cond_19
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 813
    .line 814
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 815
    .line 816
    .line 817
    move-result-object v1

    .line 818
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 819
    .line 820
    .line 821
    move-result-object v1

    .line 822
    if-eqz v1, :cond_1a

    .line 823
    .line 824
    iget v2, p0, Lcom/android/launcher3/folder/Folder;->b0:F

    .line 825
    .line 826
    invoke-virtual {v1, v2}, Landroid/view/View;->setElevation(F)V

    .line 827
    .line 828
    .line 829
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 830
    .line 831
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 832
    .line 833
    .line 834
    move-result-object v1

    .line 835
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->p2()Landroid/view/View;

    .line 836
    .line 837
    .line 838
    move-result-object v1

    .line 839
    if-eqz v1, :cond_1a

    .line 840
    .line 841
    iget v2, p0, Lcom/android/launcher3/folder/Folder;->c0:F

    .line 842
    .line 843
    invoke-virtual {v1, v2}, Landroid/view/View;->setElevation(F)V

    .line 844
    .line 845
    .line 846
    :cond_1a
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 847
    .line 848
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 849
    .line 850
    .line 851
    move-result-object v1

    .line 852
    if-eqz v1, :cond_1d

    .line 853
    .line 854
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 855
    .line 856
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 857
    .line 858
    .line 859
    move-result-object v1

    .line 860
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 861
    .line 862
    .line 863
    move-result-object v1

    .line 864
    if-eqz v1, :cond_1d

    .line 865
    .line 866
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 867
    .line 868
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 869
    .line 870
    .line 871
    move-result-object v1

    .line 872
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 873
    .line 874
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 875
    .line 876
    .line 877
    move-result v1

    .line 878
    if-eqz v1, :cond_1d

    .line 879
    .line 880
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 881
    .line 882
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 883
    .line 884
    .line 885
    move-result-object p0

    .line 886
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 887
    .line 888
    .line 889
    move-result-object p0

    .line 890
    :goto_3
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 891
    .line 892
    .line 893
    move-result v1

    .line 894
    if-ge v0, v1, :cond_1d

    .line 895
    .line 896
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 897
    .line 898
    .line 899
    move-result-object v1

    .line 900
    instance-of v1, v1, Lcom/android/launcher3/CellLayout;

    .line 901
    .line 902
    if-eqz v1, :cond_1c

    .line 903
    .line 904
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 905
    .line 906
    .line 907
    move-result-object v1

    .line 908
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 909
    .line 910
    .line 911
    move-result v1

    .line 912
    cmpg-float v1, v1, v4

    .line 913
    .line 914
    const-string v2, " ,pageCount: "

    .line 915
    .line 916
    const-string v3, " ,page: "

    .line 917
    .line 918
    if-gez v1, :cond_1b

    .line 919
    .line 920
    new-instance v1, Ljava/lang/StringBuilder;

    .line 921
    .line 922
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 923
    .line 924
    .line 925
    const-string v5, "completeCloseMFV: workspace page alpha: "

    .line 926
    .line 927
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 928
    .line 929
    .line 930
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 931
    .line 932
    .line 933
    move-result-object v5

    .line 934
    invoke-virtual {v5}, Landroid/view/View;->getAlpha()F

    .line 935
    .line 936
    .line 937
    move-result v5

    .line 938
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 939
    .line 940
    .line 941
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 942
    .line 943
    .line 944
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 945
    .line 946
    .line 947
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 948
    .line 949
    .line 950
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 951
    .line 952
    .line 953
    move-result v5

    .line 954
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 955
    .line 956
    .line 957
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 958
    .line 959
    .line 960
    move-result-object v1

    .line 961
    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 962
    .line 963
    .line 964
    :cond_1b
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 965
    .line 966
    .line 967
    move-result-object v1

    .line 968
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 969
    .line 970
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 971
    .line 972
    .line 973
    move-result-object v1

    .line 974
    if-eqz v1, :cond_1c

    .line 975
    .line 976
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getAlpha()F

    .line 977
    .line 978
    .line 979
    move-result v5

    .line 980
    cmpg-float v5, v5, v4

    .line 981
    .line 982
    if-gez v5, :cond_1c

    .line 983
    .line 984
    new-instance v5, Ljava/lang/StringBuilder;

    .line 985
    .line 986
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 987
    .line 988
    .line 989
    const-string v7, "completeCloseMFV: shortcutsAndWidgets alpha: "

    .line 990
    .line 991
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 992
    .line 993
    .line 994
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getAlpha()F

    .line 995
    .line 996
    .line 997
    move-result v1

    .line 998
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 999
    .line 1000
    .line 1001
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1002
    .line 1003
    .line 1004
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1005
    .line 1006
    .line 1007
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1008
    .line 1009
    .line 1010
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 1011
    .line 1012
    .line 1013
    move-result v1

    .line 1014
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1015
    .line 1016
    .line 1017
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v1

    .line 1021
    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1022
    .line 1023
    .line 1024
    :cond_1c
    add-int/2addr v0, p1

    .line 1025
    goto/16 :goto_3

    .line 1026
    .line 1027
    :cond_1d
    const-string p0, "close_end_finish"

    .line 1028
    .line 1029
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1030
    .line 1031
    .line 1032
    return-void
.end method

.method public static synthetic V(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->E1(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->D1(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W0()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f0b022d

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 27
    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    invoke-interface {v2, p0, v0, v1}, Lcom/android/launcher3/folder/Folder$k;->c(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/h0;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderHeight()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 57
    .line 58
    sub-int v5, v2, v4

    .line 59
    .line 60
    sub-int/2addr v3, v5

    .line 61
    const/4 v5, 0x2

    .line 62
    div-int/2addr v3, v5

    .line 63
    sub-int/2addr v3, v4

    .line 64
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_1

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    sub-int/2addr v0, v2

    .line 75
    div-int/lit8 v3, v0, 0x2

    .line 76
    .line 77
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 86
    .line 87
    div-int/2addr v0, v5

    .line 88
    int-to-float v0, v0

    .line 89
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 90
    .line 91
    add-int/2addr v3, v4

    .line 92
    sub-int/2addr v2, v4

    .line 93
    div-int/2addr v2, v5

    .line 94
    add-int/2addr v3, v2

    .line 95
    int-to-float v2, v3

    .line 96
    new-array v3, v5, [I

    .line 97
    .line 98
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 99
    .line 100
    invoke-virtual {v4, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 101
    .line 102
    .line 103
    const/4 v4, 0x0

    .line 104
    aget v4, v3, v4

    .line 105
    .line 106
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 107
    .line 108
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    div-int/2addr v6, v5

    .line 113
    add-int/2addr v4, v6

    .line 114
    int-to-float v4, v4

    .line 115
    iget v5, v1, Lcom/android/launcher3/h0;->Q1:I

    .line 116
    .line 117
    invoke-static {}, Lx1/O;->C3()Z

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    if-eqz v6, :cond_2

    .line 122
    .line 123
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 124
    .line 125
    invoke-virtual {v5}, Lcom/android/launcher3/folder/FolderIcon;->getIconSize()I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    :cond_2
    const/4 v6, 0x1

    .line 130
    aget v7, v3, v6

    .line 131
    .line 132
    iget v1, v1, Lcom/android/launcher3/X3;->s:I

    .line 133
    .line 134
    add-int/2addr v7, v1

    .line 135
    div-int/lit8 v1, v5, 0x2

    .line 136
    .line 137
    add-int/2addr v7, v1

    .line 138
    int-to-float v1, v7

    .line 139
    iget-object v7, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 140
    .line 141
    instance-of v8, v7, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 142
    .line 143
    if-eqz v8, :cond_3

    .line 144
    .line 145
    check-cast v7, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 146
    .line 147
    iget-object v1, v7, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 148
    .line 149
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    aget v3, v3, v6

    .line 158
    .line 159
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 160
    .line 161
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    add-int/2addr v3, v6

    .line 166
    int-to-float v3, v3

    .line 167
    int-to-float v6, v1

    .line 168
    const/high16 v7, 0x40000000    # 2.0f

    .line 169
    .line 170
    div-float/2addr v6, v7

    .line 171
    add-float/2addr v3, v6

    .line 172
    move v9, v3

    .line 173
    move v3, v1

    .line 174
    move v1, v9

    .line 175
    goto :goto_0

    .line 176
    :cond_3
    move v3, v5

    .line 177
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 182
    .line 183
    .line 184
    move-result v7

    .line 185
    add-int/2addr v6, v7

    .line 186
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    add-int/2addr v6, v7

    .line 191
    int-to-float v6, v6

    .line 192
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 197
    .line 198
    .line 199
    move-result v8

    .line 200
    add-int/2addr v7, v8

    .line 201
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 202
    .line 203
    .line 204
    move-result v8

    .line 205
    add-int/2addr v7, v8

    .line 206
    int-to-float v7, v7

    .line 207
    int-to-float v5, v5

    .line 208
    div-float v5, v6, v5

    .line 209
    .line 210
    iput v5, p0, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 211
    .line 212
    int-to-float v3, v3

    .line 213
    div-float/2addr v7, v3

    .line 214
    iput v7, p0, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 215
    .line 216
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 217
    .line 218
    iput v2, p0, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 219
    .line 220
    new-instance v3, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    const-string v5, "pivox="

    .line 226
    .line 227
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    iget v5, p0, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 231
    .line 232
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v5, "pivoy="

    .line 236
    .line 237
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget v5, p0, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 241
    .line 242
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v5, " fold width="

    .line 246
    .line 247
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v5, "floderX="

    .line 254
    .line 255
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    const-string v0, "floderY="

    .line 262
    .line 263
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    const-string v0, " folderIconX="

    .line 270
    .line 271
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v0, "folderIconY="

    .line 278
    .line 279
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    const-string v0, "scaleX="

    .line 286
    .line 287
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->v0:F

    .line 291
    .line 292
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    const-string v0, "scaleY="

    .line 296
    .line 297
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    iget p0, p0, Lcom/android/launcher3/folder/Folder;->w0:F

    .line 301
    .line 302
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    const-string v0, "Launcher.Folder"

    .line 310
    .line 311
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    .line 313
    .line 314
    return-void
.end method

.method public static synthetic X(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method private X0()Landroid/animation/AnimatorSet;
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->D:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, LT0/p;

    .line 11
    .line 12
    invoke-direct {v0, p0, v1}, LT0/p;-><init>(Lcom/android/launcher3/folder/Folder;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, LT0/p;->w0()Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance v0, Lcom/android/launcher3/folder/z;

    .line 21
    .line 22
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/folder/z;-><init>(Lcom/android/launcher3/folder/Folder;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/folder/z;->c()Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic Y(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->C1(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Y0()Lcom/android/launcher3/model/data/I;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->v2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->v1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/16 v1, 0x8

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 38
    .line 39
    const/16 v2, 0x20

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const v3, 0x7f1401a4

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {v0, v2, p0}, Lcom/android/launcher3/folderbatch/g;->d(Landroid/content/Context;Ljava/lang/String;Z)Lcom/android/launcher3/model/data/I;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_1
    const/4 p0, 0x0

    .line 74
    return-object p0
.end method

.method public static synthetic Z(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Z0()Landroid/animation/AnimatorSet;
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->D:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, LT0/p;

    .line 11
    .line 12
    invoke-direct {v0, p0, v1}, LT0/p;-><init>(Lcom/android/launcher3/folder/Folder;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, LT0/p;->w0()Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance v0, Lcom/android/launcher3/folder/z;

    .line 21
    .line 22
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/folder/z;-><init>(Lcom/android/launcher3/folder/Folder;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/folder/z;->c()Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic a0()V
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->z5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x3e8

    .line 8
    .line 9
    const-string v2, "folder"

    .line 10
    .line 11
    const/16 v3, 0xe

    .line 12
    .line 13
    invoke-static {v2, v3, v0, v1}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Lx1/O;->A5()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/16 v0, 0xcb

    .line 24
    .line 25
    invoke-static {v0}, Lx1/O;->A4(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method private a2(Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method private b1(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->M:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->M:Z

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->M:Z

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->s2()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private b2(Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleX(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c0(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static c1()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/folder/Folder;->I0:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private c2(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "newTitle_mOriginFolderName: "

    .line 6
    .line 7
    const-string v2, "Launcher.Folder"

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 82
    .line 83
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 84
    .line 85
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->o2(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    new-instance p0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v0, "newTitle: "

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-object p1
.end method

.method private closeComplete(Z)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->clearFocus()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x1

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 35
    .line 36
    invoke-virtual {v0, v4}, Lcom/android/launcher3/folder/FolderIcon;->setIconVisible(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->l:Lcom/android/launcher3/BubbleTextView;

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 44
    .line 45
    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->p:Lcom/android/launcher3/dragndrop/j;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 57
    .line 58
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 59
    .line 60
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-virtual {v0, v5}, Lcom/android/launcher3/folder/FolderIcon;->a0(I)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->H()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 76
    .line 77
    const/4 v5, 0x2

    .line 78
    new-array v5, v5, [F

    .line 79
    .line 80
    fill-array-data v5, :array_0

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v5}, Lcom/android/launcher3/folder/FolderIcon;->s([F)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestFocus()Z

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 92
    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 96
    .line 97
    .line 98
    iput-boolean v3, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 99
    .line 100
    :cond_4
    invoke-static {}, Lx1/O;->e2()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_6

    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    sub-int/2addr v0, v4

    .line 113
    :goto_0
    if-ltz v0, :cond_6

    .line 114
    .line 115
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 116
    .line 117
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Lcom/android/launcher3/CellLayout;

    .line 122
    .line 123
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    .line 128
    .line 129
    .line 130
    move-result v6

    .line 131
    sub-int/2addr v6, v4

    .line 132
    :goto_1
    if-ltz v6, :cond_5

    .line 133
    .line 134
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    invoke-virtual {v7, v2}, Landroid/view/View;->setAlpha(F)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v7, v2}, Landroid/view/View;->setScaleX(F)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v7, v2}, Landroid/view/View;->setScaleY(F)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v7, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 151
    .line 152
    .line 153
    add-int/lit8 v6, v6, -0x1

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_5
    add-int/lit8 v0, v0, -0x1

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-gt v0, v4, :cond_8

    .line 164
    .line 165
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 166
    .line 167
    if-nez v0, :cond_7

    .line 168
    .line 169
    iget-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->L:Z

    .line 170
    .line 171
    if-nez v1, :cond_7

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Y1()V

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_7
    if-eqz v0, :cond_9

    .line 178
    .line 179
    iput-boolean v4, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_8
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 183
    .line 184
    if-nez v0, :cond_9

    .line 185
    .line 186
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->v0()V

    .line 189
    .line 190
    .line 191
    :cond_9
    :goto_2
    iput-boolean v3, p0, Lcom/android/launcher3/folder/Folder;->L:Z

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->S0()V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0, v3}, Lcom/android/launcher3/folder/Folder;->setState(I)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 200
    .line 201
    invoke-virtual {v0, v3}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 202
    .line 203
    .line 204
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->U0(Z)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    nop

    .line 209
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic d0()V
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->z5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x3e8

    .line 8
    .line 9
    const-string v2, "folder"

    .line 10
    .line 11
    const/16 v3, 0xe

    .line 12
    .line 13
    invoke-static {v2, v3, v0, v1}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Lx1/O;->A5()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/16 v0, 0xcb

    .line 24
    .line 25
    invoke-static {v0}, Lx1/O;->A4(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method private d1(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->v2()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static synthetic e0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/T;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/widget/T;->G()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method static e1(Landroid/content/Context;)Lcom/android/launcher3/folder/Folder;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;)",
            "Lcom/android/launcher3/folder/Folder;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const p0, 0x7f0e0254

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const p0, 0x7f0e0255

    .line 24
    .line 25
    .line 26
    :goto_0
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/android/launcher3/folder/Folder;

    .line 32
    .line 33
    return-object p0
.end method

.method private e2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getElevation()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Lcom/android/launcher3/folder/Folder;->b0:F

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getElevation()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    add-float/2addr v1, v2

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->p2()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getElevation()F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iput v1, p0, Lcom/android/launcher3/folder/Folder;->c0:F

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getElevation()F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    add-float/2addr p0, v2

    .line 52
    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public static synthetic f0(Lcom/android/launcher3/folder/Folder;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->G1(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f2(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/W3;->C(Lcom/android/launcher3/K5;Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic g0(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/Folder;->A1(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private getHeightFromBottom()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 6
    .line 7
    iget v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 8
    .line 9
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 10
    .line 11
    add-int/2addr v1, v0

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 19
    .line 20
    sub-int/2addr p0, v1

    .line 21
    return p0
.end method

.method public static synthetic h0(Lcom/android/launcher3/folder/Folder;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/Folder;->M1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private h2()Z
    .locals 0

    .line 1
    invoke-static {}, Lx1/O;->O()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/cloudfolder/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/android/launcher3/folder/Folder;

    .line 7
    .line 8
    return-object p0
.end method

.method private i2(Lcom/android/launcher3/CellLayout;)Z
    .locals 5

    .line 1
    sget-object p0, Lf1/a;->r:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sub-int/2addr p1, v0

    .line 20
    const/4 v1, 0x0

    .line 21
    move v2, v1

    .line 22
    :goto_0
    if-ltz p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    instance-of v4, v3, Landroid/appwidget/AppWidgetHostView;

    .line 29
    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    instance-of v3, v3, Lcom/android/launcher3/folder/FolderIcon;

    .line 34
    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    :cond_2
    add-int/lit8 p1, p1, -0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    const/16 p0, 0xa

    .line 43
    .line 44
    if-lt v2, p0, :cond_4

    .line 45
    .line 46
    return v0

    .line 47
    :cond_4
    return v1
.end method

.method static bridge synthetic j0(Lcom/android/launcher3/folder/Folder;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method private j1(Landroid/graphics/Rect;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->C0:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput v1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aput v1, v0, v2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 20
    .line 21
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->C0:[I

    .line 22
    .line 23
    invoke-virtual {v0, v3, v4}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->C0:[I

    .line 28
    .line 29
    aget v4, v3, v1

    .line 30
    .line 31
    aget v3, v3, v2

    .line 32
    .line 33
    int-to-float v5, v4

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    int-to-float v6, v6

    .line 39
    mul-float/2addr v6, v0

    .line 40
    add-float/2addr v5, v6

    .line 41
    float-to-int v5, v5

    .line 42
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->C0:[I

    .line 43
    .line 44
    aget v2, v6, v2

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    int-to-float v6, v6

    .line 52
    mul-float/2addr v6, v0

    .line 53
    add-float/2addr v2, v6

    .line 54
    float-to-int v2, v2

    .line 55
    invoke-virtual {p1, v4, v3, v5, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget v2, v2, Lcom/android/launcher3/h0;->V0:I

    .line 71
    .line 72
    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 73
    .line 74
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 75
    .line 76
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-nez v2, :cond_0

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->C0:[I

    .line 92
    .line 93
    aget v2, v2, v1

    .line 94
    .line 95
    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 96
    .line 97
    int-to-float v2, v2

    .line 98
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    int-to-float v3, v3

    .line 103
    mul-float/2addr v0, v3

    .line 104
    add-float/2addr v2, v0

    .line 105
    float-to-int v0, v2

    .line 106
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 107
    .line 108
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 109
    .line 110
    const/16 v2, 0x8

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_1

    .line 117
    .line 118
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 119
    .line 120
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 135
    .line 136
    :cond_1
    return-void
.end method

.method static bridge synthetic k0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/globalsearch/r$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->e0:Lcom/android/launcher3/globalsearch/r$b;

    .line 2
    .line 3
    return-object p0
.end method

.method private k1(Lcom/android/launcher3/n0$a;[F)I
    .locals 2

    .line 1
    invoke-virtual {p1, p2}, Lcom/android/launcher3/n0$a;->a([F)[F

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget v0, p1, v0

    .line 9
    .line 10
    float-to-int v0, v0

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    const/4 v1, 0x1

    .line 17
    aget p1, p1, v1

    .line 18
    .line 19
    float-to-int p1, p1

    .line 20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-int/2addr p1, v1

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-int/2addr p1, p0

    .line 30
    invoke-virtual {p2, v0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->f0(II)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method static bridge synthetic l0(Lcom/android/launcher3/folder/Folder;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method private l2(ILcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->u0(I)V

    .line 8
    .line 9
    .line 10
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/c;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->S:I

    .line 21
    .line 22
    if-eq v0, p1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-void

    .line 26
    :cond_2
    :goto_0
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->S:I

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/folder/Folder$o;

    .line 36
    .line 37
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/folder/Folder$o;-><init>(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 44
    .line 45
    const-wide/16 v0, 0x1f4

    .line 46
    .line 47
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/c;->d(J)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 53
    .line 54
    .line 55
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 56
    .line 57
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 58
    .line 59
    return-void
.end method

.method static bridge synthetic m0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/anim/M;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->U:Lcom/android/launcher3/anim/M;

    .line 2
    .line 3
    return-object p0
.end method

.method private m1(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/u4;->h(Landroid/graphics/PointF;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    return v1

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v2, Landroid/graphics/PointF;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-direct {v2, v3, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v2}, Lcom/android/launcher3/u4;->e(Landroid/graphics/PointF;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    return p0

    .line 63
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 64
    .line 65
    .line 66
    return v1
.end method

.method static bridge synthetic n0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o0(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private o1()Lcom/android/launcher3/folder/Folder$k;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/folder/G;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/G;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 26
    .line 27
    const/16 v1, 0x8

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/folder/F;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/F;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/folder/H;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/H;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 62
    .line 63
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_3

    .line 82
    .line 83
    new-instance v0, Lcom/android/launcher3/folder/E;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/E;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 89
    .line 90
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 91
    .line 92
    return-object p0
.end method

.method private o2(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/widget/EditText;->getPaddingRight()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v1, v2

    .line 20
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n0:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    add-int/2addr v1, v2

    .line 27
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/widget/EditText;->getCompoundDrawablePadding()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    add-int/2addr v1, v2

    .line 34
    sub-int/2addr v0, v1

    .line 35
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    int-to-float v0, v0

    .line 42
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 43
    .line 44
    invoke-static {p1, p0, v0, v1}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method static bridge synthetic p0(Lcom/android/launcher3/folder/Folder;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method private p2(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-static {v0, p1}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Lcom/android/launcher3/folder/s;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/android/launcher3/folder/s;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, [Lcom/android/launcher3/model/data/y;

    .line 43
    .line 44
    array-length v0, p1

    .line 45
    if-lez v0, :cond_0

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 49
    .line 50
    .line 51
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->x0:Z

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method static bridge synthetic q0(Lcom/android/launcher3/folder/Folder;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 2
    .line 3
    return-void
.end method

.method private q2()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/A;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v1, v1, Lcom/android/launcher3/h0;->M1:I

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v2, v2, Lcom/android/launcher3/h0;->L1:I

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/folder/A;-><init>(II)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x0

    .line 47
    :goto_0
    if-ge v2, v1, :cond_0

    .line 48
    .line 49
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 60
    .line 61
    invoke-virtual {v0, v3, v2}, Lcom/android/launcher3/folder/A;->m(Lcom/android/launcher3/model/data/y;I)Z

    .line 62
    .line 63
    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    return-void
.end method

.method static bridge synthetic r0(Lcom/android/launcher3/folder/Folder;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->closeComplete(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic s0(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->e2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic t0(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/android/launcher3/folder/Folder;->I0:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private t1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public static t2(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/model/data/p;->R(I)Z

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

.method static synthetic u0(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic v0(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic w0(Lcom/android/launcher3/folder/Folder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method private x0(Landroid/animation/AnimatorSet;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    sput-object v0, Lcom/android/launcher3/folder/Folder;->I0:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 20
    .line 21
    new-instance v1, Lcom/android/launcher3/folder/g;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/folder/g;-><init>(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/g0;->c(Ljava/util/function/Consumer;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Lcom/android/launcher3/folder/Folder$c;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/folder/Folder$c;-><init>(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic x1(Landroid/animation/AnimatorSet;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/Folder;->y0(Landroid/animation/AnimatorSet;Lcom/android/launcher3/CellLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private y0(Landroid/animation/AnimatorSet;Lcom/android/launcher3/CellLayout;)V
    .locals 3

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/folder/Folder;->i2(Lcom/android/launcher3/CellLayout;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->Y()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Lcom/android/launcher3/folder/Folder$d;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0, p2, v1}, Lcom/android/launcher3/folder/Folder$d;-><init>(Lcom/android/launcher3/folder/Folder;ZLcom/android/launcher3/CellLayout;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic y1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-gt v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Y1()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private synthetic z1(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method A0(Lcom/android/launcher3/dragndrop/p;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p1, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Lcom/android/launcher3/folder/Folder$b;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 20
    .line 21
    new-instance v2, Lcom/android/launcher3/folder/u;

    .line 22
    .line 23
    invoke-direct {v2}, Lcom/android/launcher3/folder/u;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-direct {v0, p0, v1, v2}, Lcom/android/launcher3/folder/Folder$b;-><init>(Lcom/android/launcher3/folder/Folder;Landroid/view/ViewGroup;Ljava/util/function/Function;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method protected B0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f0b022d

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/dragndrop/DragLayer;

    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/h1$a;

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    invoke-direct {v1, v2, v2}, Lcom/android/launcher3/h1$a;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, v2}, Lcom/android/launcher3/h1$a;->a(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    sub-int/2addr v3, v2

    .line 31
    :goto_0
    if-ltz v3, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    instance-of v4, v4, Lcom/android/launcher3/folder/Folder$l;

    .line 38
    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    add-int/lit8 v3, v3, -0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance v2, Lcom/android/launcher3/folder/Folder$l;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-direct {v2, v3}, Lcom/android/launcher3/folder/Folder$l;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    iput-object v2, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 58
    .line 59
    const v2, 0x7f0b0230

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iput v3, p0, Lcom/android/launcher3/folder/Folder;->k0:I

    .line 71
    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v4, "mTargetBarIndex: "

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->k0:I

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const-string v4, "Launcher.Folder"

    .line 92
    .line 93
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    invoke-static {}, Lx1/O;->N1()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    const/16 v5, 0x33

    .line 101
    .line 102
    if-nez v3, :cond_3

    .line 103
    .line 104
    invoke-static {}, Lx1/O;->c0()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->h2()Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_3

    .line 115
    .line 116
    invoke-static {}, Lx1/O;->C2()Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-nez v3, :cond_3

    .line 121
    .line 122
    invoke-static {}, Lx1/O;->m1()Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_3

    .line 127
    .line 128
    invoke-static {}, Lx1/O;->l2()Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-nez v3, :cond_3

    .line 133
    .line 134
    const-string v3, "addFolderBackgroundView: use blurred wallpaper cache."

    .line 135
    .line 136
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 140
    .line 141
    check-cast v3, Landroid/content/Context;

    .line 142
    .line 143
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->u()Landroid/graphics/Bitmap;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    iput-object v3, p0, Lcom/android/launcher3/folder/Folder;->j0:Landroid/graphics/Bitmap;

    .line 156
    .line 157
    new-instance v3, Landroid/graphics/Canvas;

    .line 158
    .line 159
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->j0:Landroid/graphics/Bitmap;

    .line 160
    .line 161
    invoke-direct {v3, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 162
    .line 163
    .line 164
    new-instance v6, Landroid/graphics/Paint;

    .line 165
    .line 166
    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 167
    .line 168
    .line 169
    iget-object v7, p0, Lcom/android/launcher3/folder/Folder;->j0:Landroid/graphics/Bitmap;

    .line 170
    .line 171
    const/4 v8, 0x0

    .line 172
    invoke-virtual {v3, v7, v8, v8, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 173
    .line 174
    .line 175
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 176
    .line 177
    invoke-virtual {v6}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getForeColor()I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    invoke-static {v6}, Lx1/O;->G0(I)I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    invoke-static {v6, v5}, Ls1/q;->h(II)I

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    invoke-virtual {v3, v5}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 194
    .line 195
    .line 196
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 197
    .line 198
    invoke-virtual {v3}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    if-nez v3, :cond_6

    .line 203
    .line 204
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->j0:Landroid/graphics/Bitmap;

    .line 205
    .line 206
    if-eqz v3, :cond_2

    .line 207
    .line 208
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-nez v3, :cond_2

    .line 213
    .line 214
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 215
    .line 216
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 217
    .line 218
    check-cast v5, Landroid/content/Context;

    .line 219
    .line 220
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->j0:Landroid/graphics/Bitmap;

    .line 221
    .line 222
    invoke-static {v5, v6}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 227
    .line 228
    .line 229
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 230
    .line 231
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 235
    .line 236
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v2}, Landroid/view/View;->bringToFront()V

    .line 240
    .line 241
    .line 242
    const-string p0, "Add Blur View!"

    .line 243
    .line 244
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_2
    const-string p0, "unable to add blur view!"

    .line 249
    .line 250
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_3
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 255
    .line 256
    invoke-virtual {v3}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    if-nez v3, :cond_6

    .line 261
    .line 262
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_4

    .line 271
    .line 272
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 273
    .line 274
    const/4 v5, 0x0

    .line 275
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 276
    .line 277
    .line 278
    goto :goto_2

    .line 279
    :cond_4
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 280
    .line 281
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 282
    .line 283
    invoke-virtual {v6}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    invoke-virtual {v6}, Lcom/android/launcher3/v;->getForeColor()I

    .line 288
    .line 289
    .line 290
    move-result v6

    .line 291
    invoke-static {v6}, Lx1/O;->G0(I)I

    .line 292
    .line 293
    .line 294
    move-result v6

    .line 295
    invoke-static {}, Lx1/O;->c0()Z

    .line 296
    .line 297
    .line 298
    move-result v7

    .line 299
    if-eqz v7, :cond_5

    .line 300
    .line 301
    goto :goto_1

    .line 302
    :cond_5
    const/16 v5, 0x4c

    .line 303
    .line 304
    :goto_1
    invoke-static {v6, v5}, Ls1/q;->h(II)I

    .line 305
    .line 306
    .line 307
    move-result v5

    .line 308
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 309
    .line 310
    .line 311
    :goto_2
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 312
    .line 313
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 314
    .line 315
    .line 316
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->i0:Lcom/android/launcher3/folder/Folder$l;

    .line 317
    .line 318
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2}, Landroid/view/View;->bringToFront()V

    .line 322
    .line 323
    .line 324
    const-string p0, "addFolderBackgroundView View!"

    .line 325
    .line 326
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    .line 328
    .line 329
    :cond_6
    return-void
.end method

.method public C0(ZZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->v2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->v1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 30
    .line 31
    const/16 v2, 0x20

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const v3, 0x7f1401a4

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 55
    .line 56
    invoke-virtual {v3, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/folderbatch/g;->d(Landroid/content/Context;Ljava/lang/String;Z)Lcom/android/launcher3/model/data/I;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/Folder;->p2(Lcom/android/launcher3/model/data/y;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/FolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 72
    .line 73
    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 80
    .line 81
    .line 82
    :cond_1
    if-eqz p2, :cond_2

    .line 83
    .line 84
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 85
    .line 86
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 91
    .line 92
    iget p1, p1, Lcom/android/launcher3/r4;->U:I

    .line 93
    .line 94
    iget p2, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 95
    .line 96
    div-int/2addr p2, p1

    .line 97
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 100
    .line 101
    .line 102
    :cond_2
    const/4 p1, 0x1

    .line 103
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->x0:Z

    .line 104
    .line 105
    :cond_3
    return-void
.end method

.method public D()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public D0(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public E0(Lcom/android/launcher3/model/data/y;IZ)V
    .locals 10

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
    if-eqz v0, :cond_7

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p2, v1, v0}, Lcom/android/launcher3/N5;->c(III)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/4 v3, 0x1

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {p2, v1, v2}, Lcom/android/launcher3/N5;->c(III)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    sub-int/2addr v2, v3

    .line 53
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Landroid/view/View;

    .line 58
    .line 59
    invoke-static {v2}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-ne p2, v0, :cond_0

    .line 70
    .line 71
    add-int/lit8 p2, p2, -0x1

    .line 72
    .line 73
    :cond_0
    iput p2, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->M:Z

    .line 85
    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 89
    .line 90
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v0}, Lcom/android/launcher3/folder/A;->b(Lcom/android/launcher3/h0;)Lcom/android/launcher3/folder/A;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/folder/A;->m(Lcom/android/launcher3/model/data/y;I)Z

    .line 105
    .line 106
    .line 107
    invoke-static {p1}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 120
    .line 121
    iget v6, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 122
    .line 123
    iget v8, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 124
    .line 125
    iget v9, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 126
    .line 127
    const/4 v7, 0x0

    .line 128
    move-object v5, p1

    .line 129
    invoke-virtual/range {v4 .. v9}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_1
    move-object v5, p1

    .line 134
    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->W()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_2

    .line 144
    .line 145
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 146
    .line 147
    invoke-virtual {p1, v5, p2}, Lcom/android/launcher3/folder/FolderPagedView;->d0(Lcom/android/launcher3/model/data/y;I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    :cond_2
    iput-boolean v3, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->s2()V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_3
    move-object v5, p1

    .line 157
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Lz1/J3;->Y(Lcom/android/launcher3/model/data/y;)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 169
    .line 170
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iget-boolean p1, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 175
    .line 176
    if-eqz p1, :cond_4

    .line 177
    .line 178
    invoke-static {v5}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-eqz p1, :cond_4

    .line 183
    .line 184
    new-instance p0, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .line 188
    .line 189
    const-string p1, "addFolderContent: isFolderBatchItem return rank="

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    const-string p1, "Launcher.Folder"

    .line 202
    .line 203
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 208
    .line 209
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iget-boolean p1, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 214
    .line 215
    if-eqz p1, :cond_6

    .line 216
    .line 217
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 218
    .line 219
    instance-of p2, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 220
    .line 221
    if-eqz p2, :cond_5

    .line 222
    .line 223
    check-cast p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 224
    .line 225
    iget-boolean p1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->k0:Z

    .line 226
    .line 227
    if-nez p1, :cond_5

    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_5
    return-void

    .line 231
    :cond_6
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 232
    .line 233
    invoke-virtual {p0, p3}, Lcom/android/launcher3/folder/FolderIcon;->b0(Z)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 238
    .line 239
    const-string p1, "tried to add an illegal type into a folder"

    .line 240
    .line 241
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    throw p0
.end method

.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 2
    .line 3
    if-eq p2, p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p2, "Launcher.Folder"

    .line 7
    .line 8
    const-string v0, "onDragStart: in. "

    .line 9
    .line 10
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/android/launcher3/folder/FolderPagedView;->r0(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 22
    .line 23
    new-instance v0, Lcom/android/launcher3/folder/i;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/folder/i;-><init>(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/Folder;->b1(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iput-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 37
    .line 38
    const/16 v0, 0x8

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/Folder;->setFolderBackground(Z)V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_0
    return-void
.end method

.method public F0(Lcom/android/launcher3/folder/Folder$m;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->D:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public G(Lcom/android/launcher3/n0$a;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_4

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/c;->a()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto/16 :goto_4

    .line 28
    .line 29
    :cond_1
    const/4 v0, 0x2

    .line 30
    new-array v0, v0, [F

    .line 31
    .line 32
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/folder/Folder;->k1(Lcom/android/launcher3/n0$a;[F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 37
    .line 38
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->J1(Lcom/android/launcher3/n0$a;)V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 42
    .line 43
    iget v2, p0, Lcom/android/launcher3/folder/Folder;->z:I

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    if-eq v1, v2, :cond_2

    .line 47
    .line 48
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/android/launcher3/c;->b()V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->W:Lcom/android/launcher3/L4;

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 61
    .line 62
    const-wide/16 v4, 0xfa

    .line 63
    .line 64
    invoke-virtual {v1, v4, v5}, Lcom/android/launcher3/c;->d(J)V

    .line 65
    .line 66
    .line 67
    iget v1, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 68
    .line 69
    iput v1, p0, Lcom/android/launcher3/folder/Folder;->z:I

    .line 70
    .line 71
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 80
    .line 81
    add-int/2addr v4, v3

    .line 82
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    const v5, 0x7f14027a

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v5, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v1, v2}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    const/4 v1, 0x0

    .line 101
    aget v0, v0, v1

    .line 102
    .line 103
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 104
    .line 105
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 110
    .line 111
    invoke-virtual {v4}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    int-to-float v4, v4

    .line 120
    const v5, 0x3ee66666    # 0.45f

    .line 121
    .line 122
    .line 123
    mul-float/2addr v4, v5

    .line 124
    cmpg-float v5, v0, v4

    .line 125
    .line 126
    if-gez v5, :cond_3

    .line 127
    .line 128
    move v5, v3

    .line 129
    goto :goto_0

    .line 130
    :cond_3
    move v5, v1

    .line 131
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    int-to-float v6, v6

    .line 136
    sub-float/2addr v6, v4

    .line 137
    cmpl-float v0, v0, v6

    .line 138
    .line 139
    if-lez v0, :cond_4

    .line 140
    .line 141
    move v0, v3

    .line 142
    goto :goto_1

    .line 143
    :cond_4
    move v0, v1

    .line 144
    :goto_1
    if-lez v2, :cond_6

    .line 145
    .line 146
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 147
    .line 148
    iget-boolean v4, v4, Lcom/android/launcher3/folder/FolderPagedView;->j:Z

    .line 149
    .line 150
    if-eqz v4, :cond_5

    .line 151
    .line 152
    if-eqz v0, :cond_6

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_5
    if-eqz v5, :cond_6

    .line 156
    .line 157
    :goto_2
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/folder/Folder;->l2(ILcom/android/launcher3/n0$a;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    sub-int/2addr v1, v3

    .line 168
    if-ge v2, v1, :cond_8

    .line 169
    .line 170
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 171
    .line 172
    iget-boolean v1, v1, Lcom/android/launcher3/folder/FolderPagedView;->j:Z

    .line 173
    .line 174
    if-eqz v1, :cond_7

    .line 175
    .line 176
    if-eqz v5, :cond_8

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_7
    if-eqz v0, :cond_8

    .line 180
    .line 181
    :goto_3
    invoke-direct {p0, v3, p1}, Lcom/android/launcher3/folder/Folder;->l2(ILcom/android/launcher3/n0$a;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 186
    .line 187
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 188
    .line 189
    .line 190
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 191
    .line 192
    const/4 v0, -0x1

    .line 193
    if-eq p1, v0, :cond_9

    .line 194
    .line 195
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->a0()V

    .line 198
    .line 199
    .line 200
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 201
    .line 202
    :cond_9
    :goto_4
    return-void
.end method

.method public H()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_1
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/Folder;->c2(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/model/data/p;->Q(Ljava/lang/CharSequence;Lz1/J3;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/FolderIcon;->c0(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->o0:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/4 v2, 0x0

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 57
    .line 58
    check-cast v1, Landroid/content/Context;

    .line 59
    .line 60
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 69
    .line 70
    iget v3, v3, Lcom/android/launcher3/model/data/y;->id:I

    .line 71
    .line 72
    invoke-virtual {v1, v3, v2, v0}, Lcom/android/launcher3/H5;->p1(IILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 78
    .line 79
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    const/4 v3, 0x0

    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 87
    .line 88
    const v4, 0x7f1401a8

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setHint(I)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 95
    .line 96
    const-string v4, ""

    .line 97
    .line 98
    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    :goto_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const v4, 0x7f1401ae

    .line 112
    .line 113
    .line 114
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v1, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const/16 v1, 0x20

    .line 123
    .line 124
    invoke-static {p0, v1, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendCustomAccessibilityEvent(Landroid/view/View;ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 133
    .line 134
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-static {v0, v2, v2}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 139
    .line 140
    .line 141
    iput-boolean v2, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 142
    .line 143
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 144
    .line 145
    invoke-virtual {p0, v3}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 146
    .line 147
    .line 148
    const/4 p0, 0x1

    .line 149
    return p0
.end method

.method public I(Lcom/android/launcher3/n0$a;)Z
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->p0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lz1/y0;->z(Lcom/android/launcher3/model/data/y;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const-string p0, "Launcher.Folder"

    .line 38
    .line 39
    const-string p1, "acceptDrop: monkey is running, repeated icons cannot be added."

    .line 40
    .line 41
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_0
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 49
    .line 50
    invoke-static {p0}, Lcom/android/launcher3/model/data/p;->R(I)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method

.method public I0()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iput v2, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 35
    .line 36
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-boolean v2, v2, Lcom/android/launcher3/X3;->B0:Z

    .line 41
    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget v2, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 47
    .line 48
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/android/launcher3/folder/FolderPagedView;->l0()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    div-int/2addr v2, v3

    .line 55
    :goto_0
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/folder/Folder;->H0(Ljava/util/List;I)V

    .line 56
    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->y0:Z

    .line 59
    .line 60
    return-void
.end method

.method public I1()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public J(Lcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 4
    .line 5
    const/16 v1, -0x65

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const v2, 0x7f0b02eb

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-boolean p1, p1, Lcom/android/launcher3/n0$a;->e:Z

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->a0:Lcom/android/launcher3/L4;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 42
    .line 43
    const-wide/16 v0, 0x190

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/c;->d(J)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 61
    .line 62
    .line 63
    iget p1, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 64
    .line 65
    const/4 v0, -0x1

    .line 66
    if-eq p1, v0, :cond_2

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->a0()V

    .line 71
    .line 72
    .line 73
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 74
    .line 75
    :cond_2
    return-void
.end method

.method J0(Lcom/android/launcher3/model/data/p;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->r:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->H()Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->s:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :try_start_0
    sget-object v0, Lcom/android/launcher3/folder/Folder;->H0:Ljava/util/Comparator;

    .line 18
    .line 19
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    const-string v1, "Launcher.Folder"

    .line 25
    .line 26
    const-string v2, "bind: sort content failed."

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    :goto_0
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->K0(Ljava/util/ArrayList;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    new-instance p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-direct {p1, v1, v1}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 50
    .line 51
    .line 52
    iput-boolean v0, p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Q1()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 61
    .line 62
    new-instance v0, Lcom/android/launcher3/folder/o;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/o;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public L0()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "folder: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " folder.count: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "Launcher.Folder"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v1, 0x1

    .line 54
    if-gt v0, v1, :cond_0

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Y1()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method M0(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p0, p2}, Lcom/android/launcher3/folder/g0;->b(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q1()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->O0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->s2()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 31
    .line 32
    const v2, 0x7f140176

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(I)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 39
    .line 40
    const/16 v2, 0x8

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/folder/Folder;->C0(ZZ)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public R0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->a1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public R1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->W()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->X(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 21
    .line 22
    return-void
.end method

.method S0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 6
    .line 7
    return-void
.end method

.method T0(Lcom/android/launcher3/folder/Folder;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    invoke-virtual {p1, p0}, Lcom/android/launcher3/a;->close(Z)V

    .line 7
    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public T1(Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public U1()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->t1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lcom/android/launcher3/folder/p;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/android/launcher3/folder/p;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, [Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    add-int/lit8 v0, v0, -0x1

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public V0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 7
    .line 8
    const/16 v2, 0x8

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->u2()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :cond_1
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 35
    .line 36
    if-ne v0, v1, :cond_2

    .line 37
    .line 38
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->S0()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public V1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x7f1401a4

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 17
    .line 18
    const/16 v3, 0x8

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/folderbatch/g;->d(Landroid/content/Context;Ljava/lang/String;Z)Lcom/android/launcher3/model/data/I;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/Folder;->p2(Lcom/android/launcher3/model/data/y;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public varargs W1(Z[Lcom/android/launcher3/model/data/y;)V
    .locals 3

    .line 1
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lz1/J3;->Y(Lcom/android/launcher3/model/data/y;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->M:Z

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    if-nez v0, :cond_4

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/folder/x;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/x;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p2, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 44
    .line 45
    if-ne v0, v1, :cond_1

    .line 46
    .line 47
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->q2()V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-gt v0, v1, :cond_3

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->t1()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 73
    .line 74
    const/16 v2, 0x8

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Y1()V

    .line 87
    .line 88
    .line 89
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->s2()V

    .line 90
    .line 91
    .line 92
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 93
    .line 94
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 99
    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-ne v0, v1, :cond_5

    .line 107
    .line 108
    invoke-interface {p2}, Ljava/util/List;->getFirst()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 113
    .line 114
    invoke-static {p2}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_5

    .line 119
    .line 120
    const-string p0, "Launcher.Folder"

    .line 121
    .line 122
    const-string p1, "removeFolderContent: isFolderBatchItem return "

    .line 123
    .line 124
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_5
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 129
    .line 130
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    iget-boolean p2, p2, Lcom/android/launcher3/X3;->B0:Z

    .line 135
    .line 136
    if-eqz p2, :cond_7

    .line 137
    .line 138
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 139
    .line 140
    instance-of v0, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 141
    .line 142
    if-eqz v0, :cond_6

    .line 143
    .line 144
    check-cast p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 145
    .line 146
    iget-boolean p2, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->k0:Z

    .line 147
    .line 148
    if-nez p2, :cond_6

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_6
    return-void

    .line 152
    :cond_7
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderIcon;->b0(Z)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public X1(Lcom/android/launcher3/folder/Folder$m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->D:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method Y1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    if-le v0, v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 26
    .line 27
    const/16 v1, 0x20

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    const-string p0, "Launcher.Folder"

    .line 73
    .line 74
    const-string v0, "replaceFolderWithFinalItem isMoreDragMode return"

    .line 75
    .line 76
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 81
    .line 82
    instance-of v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 83
    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->x1()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/g0;->j(Lcom/android/launcher3/folder/Folder;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->P:Z

    .line 99
    .line 100
    :cond_4
    :goto_0
    return-void
.end method

.method public Z1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/cloudfolder/a;->m()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public a(Lcom/android/launcher3/model/data/y;IZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onAdd: rank: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", item: "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "Launcher.Folder"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/folder/Folder;->E0(Lcom/android/launcher3/model/data/y;IZ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public a1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public animateOpen()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    invoke-static {v0, v1}, Lx1/O;->p4(J)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/folder/Folder;->H0(Ljava/util/List;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getHitRect(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/folder/Folder;->Q:I

    .line 7
    .line 8
    sub-int/2addr v0, v1

    .line 9
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    add-int/2addr v0, v1

    .line 14
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->j1(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/c;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->W:Lcom/android/launcher3/L4;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 17
    .line 18
    invoke-interface {v0, p0}, Lcom/android/launcher3/L4;->a(Lcom/android/launcher3/c;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public canInterceptEventsInSystemGestureRegion()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIsEditingName()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 10
    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public d2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->P:Z

    .line 3
    .line 4
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->B:Landroid/graphics/Path;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->B:Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->V:Landroid/graphics/drawable/GradientDrawable;

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 20
    .line 21
    .line 22
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->V:Landroid/graphics/drawable/GradientDrawable;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 29
    .line 30
    .line 31
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f1(Ld1/d;)Lcom/android/launcher3/model/data/I;
    .locals 4

    .line 1
    new-instance p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/content/Intent;

    .line 7
    .line 8
    const-string v1, "android.intent.action.MAIN"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    const-string v1, "android.intent.category.LAUNCHER"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const/high16 v1, 0x10200000

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    new-instance v1, Landroid/content/ComponentName;

    .line 25
    .line 26
    iget-object v2, p1, Ld1/d;->c:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "null"

    .line 29
    .line 30
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 41
    .line 42
    iget-object v1, p1, Ld1/d;->b:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 47
    .line 48
    const/4 v0, 0x2

    .line 49
    iput v0, p0, Lcom/android/launcher3/model/data/I;->m:I

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 53
    .line 54
    iget v0, p1, Ld1/d;->a:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/I;->c0(I)V

    .line 57
    .line 58
    .line 59
    iget v0, p1, Ld1/d;->d:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 62
    .line 63
    .line 64
    iget v0, p1, Ld1/d;->i:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/I;->h0(I)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p1, Ld1/d;->j:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/android/launcher3/model/data/I;->e0(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method public focusSearch(I)Landroid/view/View;
    .locals 2

    .line 1
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method g1(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    add-int/2addr v0, p1

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method g2(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 27
    .line 28
    const/16 v0, 0x20

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v0, "Couldn\'t animate folder open because items is: "

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "Launcher.Folder"

    .line 54
    .line 55
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_1
    return v1
.end method

.method protected getAccessibilityInitialFocusView()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getFirstItem()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/a;->getAccessibilityInitialFocusView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method protected getAccessibilityTarget()Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getAccessibilityDescription()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const v1, 0x7f1401a6

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->V:Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCloudFolder()Lcom/android/launcher3/cloudfolder/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContent()Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getContentAreaHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getMaxContentAreaHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x5

    .line 16
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method getContentAreaWidth()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x5

    .line 8
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getContentWrapper()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method getCurrentDragView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method getDeleteFolderOnDropCompleted()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->p:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method getFolderHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->g1(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getFolderIcon()Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method getFolderName()Lcom/android/launcher3/folder/FolderNameEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFolderPageView()Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFolderWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getDesiredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/2addr v0, p0

    .line 17
    return v0
.end method

.method public getFooter()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFooterHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconsInReadingOrder()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->k:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->B0:Landroid/view/View;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/folder/t;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/t;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->B0:Landroid/view/View;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->k:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 34
    .line 35
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->k:Ljava/util/ArrayList;

    .line 36
    .line 37
    return-object p0
.end method

.method public getInfo()Lcom/android/launcher3/model/data/p;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return-object p0
.end method

.method getIsDragInProgress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsEditingName()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 2
    .line 3
    return p0
.end method

.method getIsExternalDrag()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method getIsLauncherDraggingEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method getIsOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method getItemAddedBackToSelfViaIcon()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 2
    .line 3
    return p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method getItemsInvalidated()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method getMaxContentAreaHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/android/launcher3/h0;->W0:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sub-int/2addr v0, p0

    .line 14
    return v0
.end method

.method getOnExitAlarm()Lcom/android/launcher3/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-object p0
.end method

.method getOnScrollHintAlarm()Lcom/android/launcher3/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-object p0
.end method

.method getRearrangeOnClose()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method getReorderAlarm()Lcom/android/launcher3/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightCellLayout()Lcom/android/launcher3/CellLayout;
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "Launcher.Folder"

    .line 16
    .line 17
    const/4 v2, -0x1

    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v3, "currentPage == -1; currentPage = "

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-ne v0, v3, :cond_1

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v2, "currentPage == mLauncher.getWorkspace().getChildCount(); currentPage = "

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    :goto_0
    move v0, v2

    .line 75
    goto :goto_1

    .line 76
    :cond_1
    if-lt v0, v2, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-le v0, v2, :cond_3

    .line 83
    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getValidateCurrentPage()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    new-instance v3, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v4, "getRightCellLayout: currentPage is out of range, old: "

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, ", new: "

    .line 102
    .line 103
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 122
    .line 123
    return-object p0
.end method

.method getScrollAreaOffset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/Folder;->Q:I

    .line 2
    .line 3
    return p0
.end method

.method getScrollHintDir()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 2
    .line 3
    return p0
.end method

.method getScrollPauseAlarm()Lcom/android/launcher3/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-object p0
.end method

.method getState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 2
    .line 3
    return p0
.end method

.method getTempRect()Landroid/graphics/Rect;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/folder/Folder;->G0:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWorkFolder()Lcom/android/launcher3/folder/B0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->D0:Lcom/android/launcher3/folder/B0;

    .line 2
    .line 3
    return-object p0
.end method

.method public h1(I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->l0()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-ne p1, v1, :cond_0

    .line 24
    .line 25
    mul-int v1, p0, p1

    .line 26
    .line 27
    sub-int/2addr v2, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v2, p0

    .line 30
    :goto_0
    mul-int/2addr p1, p0

    .line 31
    add-int p0, p1, v2

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-static {p0, v1}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    new-instance v1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 44
    .line 45
    .line 46
    :goto_1
    if-ge p1, p0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Landroid/view/View;

    .line 53
    .line 54
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    add-int/lit8 p1, p1, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    return-object v1
.end method

.method protected handleClose(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->l0:Z

    .line 7
    .line 8
    const-string v1, "Launcher.Folder"

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p0, "handleClose return, Folder is closing."

    .line 13
    .line 14
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/T6;->L()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string p0, "handleClose return, Folder is scrolling."

    .line 29
    .line 30
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->l0:Z

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    if-ne v0, v2, :cond_2

    .line 55
    .line 56
    move p1, v3

    .line 57
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderIcon()Lcom/android/launcher3/folder/FolderIcon;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->T:Lx1/v;

    .line 62
    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFolderIcon()Lcom/android/launcher3/folder/FolderIcon;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->T:Lx1/v;

    .line 70
    .line 71
    invoke-virtual {v0}, Lx1/v;->e()V

    .line 72
    .line 73
    .line 74
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 87
    .line 88
    .line 89
    :cond_4
    invoke-static {}, Lx1/O;->e2()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 96
    .line 97
    new-instance v2, Lcom/android/launcher3/folder/q;

    .line 98
    .line 99
    invoke-direct {v2}, Lcom/android/launcher3/folder/q;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    :cond_5
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->O1(Z)V

    .line 106
    .line 107
    .line 108
    iput-boolean v3, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 111
    .line 112
    invoke-virtual {v0, v3}, Lcom/android/launcher3/folder/FolderPagedView;->setCanAnnouncePageDescriptionForFolder(Z)V

    .line 113
    .line 114
    .line 115
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 116
    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/android/launcher3/ExtendedEditText;->h()V

    .line 122
    .line 123
    .line 124
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 125
    .line 126
    if-eqz v0, :cond_7

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->u()V

    .line 129
    .line 130
    .line 131
    :cond_7
    if-eqz p1, :cond_8

    .line 132
    .line 133
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->h2()Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_8

    .line 138
    .line 139
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->G0()V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_8
    invoke-direct {p0, v3}, Lcom/android/launcher3/folder/Folder;->closeComplete(Z)V

    .line 144
    .line 145
    .line 146
    new-instance p1, Lcom/android/launcher3/folder/r;

    .line 147
    .line 148
    invoke-direct {p1, p0}, Lcom/android/launcher3/folder/r;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 152
    .line 153
    .line 154
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 155
    .line 156
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    const/16 v0, 0x20

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->sendAccessibilityEvent(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 166
    .line 167
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_9

    .line 172
    .line 173
    const-string p1, "private-folder close, allow screenshots."

    .line 174
    .line 175
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    const/16 p1, 0x2000

    .line 189
    .line 190
    invoke-virtual {p0, p1}, Landroid/view/Window;->clearFlags(I)V

    .line 191
    .line 192
    .line 193
    :cond_9
    return-void
.end method

.method public isLayoutRtl()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutDirection()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    and-int/2addr p1, p0

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public j2(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->l1(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method k2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/folder/K;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/folder/K;->e()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 38
    .line 39
    const-string v1, ""

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/android/launcher3/folder/K;->c()[Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x0

    .line 55
    aget-object v1, v1, v2

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/ExtendedEditText;->n()Z

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/android/launcher3/folder/K;->c()[Ljava/lang/CharSequence;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {v1}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    new-instance v2, Lcom/android/launcher3/folder/j;

    .line 85
    .line 86
    invoke-direct {v2}, Lcom/android/launcher3/folder/j;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    new-instance v2, Lcom/android/launcher3/folder/k;

    .line 94
    .line 95
    invoke-direct {v2}, Lcom/android/launcher3/folder/k;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v2, Lcom/android/launcher3/folder/l;

    .line 103
    .line 104
    invoke-direct {v2}, Lcom/android/launcher3/folder/l;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    new-instance v2, Lcom/android/launcher3/folder/n;

    .line 112
    .line 113
    invoke-direct {v2, p0}, Lcom/android/launcher3/folder/n;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 114
    .line 115
    .line 116
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    check-cast p0, Ljava/util/List;

    .line 129
    .line 130
    invoke-virtual {v0, p0}, Lcom/android/launcher3/folder/FolderNameEditText;->r(Ljava/util/List;)V

    .line 131
    .line 132
    .line 133
    :cond_2
    :goto_0
    return-void
.end method

.method public l(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->z:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->getDragRegionWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    div-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    iget p1, p1, Lcom/android/launcher3/n0$a;->c:I

    .line 18
    .line 19
    sub-int/2addr v0, p1

    .line 20
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->Q:I

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 23
    .line 24
    const/16 v0, 0x8

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->setFolderBackground(Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method l1(Lcom/android/launcher3/model/data/y;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/folder/c;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/android/launcher3/folder/c;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public m2(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    iget v1, v0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 12
    .line 13
    iput v1, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/Folder;->A0(Lcom/android/launcher3/dragndrop/p;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, p1}, Lcom/android/launcher3/G4;->m(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->t1()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p2, Lcom/android/launcher3/dragndrop/p;

    .line 46
    .line 47
    invoke-direct {p2}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, p0, v0, p2}, Lcom/android/launcher3/touch/A;->c(Landroid/view/View;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/dragndrop/p;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/Folder;->M0(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 58
    return p0
.end method

.method public n1(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->l1(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x4

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public n2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->k2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->m0:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    return-object p1
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/ExtendedEditText;->g(Landroid/view/View$OnFocusChangeListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onBackInvoked()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/ExtendedEditText;->h()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    :cond_1
    invoke-super {p0}, Lcom/android/launcher3/a;->onBackInvoked()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_6

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v3, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    invoke-interface {v1, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    return v2

    .line 29
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 35
    .line 36
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/ExtendedEditText;->h()V

    .line 45
    .line 46
    .line 47
    return v3

    .line 48
    :cond_1
    return v2

    .line 49
    :cond_2
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_3

    .line 54
    .line 55
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 56
    .line 57
    invoke-virtual {v1, p1, v0, p0}, Lcom/android/launcher3/folder/g0;->h(Landroid/view/MotionEvent;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/folder/Folder;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->m1(Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->D0:Lcom/android/launcher3/folder/B0;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    invoke-virtual {v1, p1}, Lcom/android/launcher3/folder/B0;->c(Landroid/view/MotionEvent;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->D0:Lcom/android/launcher3/folder/B0;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/B0;->b(Landroid/view/MotionEvent;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    return p0

    .line 85
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 86
    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    invoke-virtual {v1, p1}, Lcom/android/launcher3/cloudfolder/a;->j(Landroid/view/MotionEvent;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_5

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lcom/android/launcher3/cloudfolder/a;->g(Landroid/view/MotionEvent;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_5
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 103
    .line 104
    if-eqz v1, :cond_6

    .line 105
    .line 106
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_6

    .line 111
    .line 112
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 113
    .line 114
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_6

    .line 119
    .line 120
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 121
    .line 122
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_6

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->f0:Lcom/android/launcher3/cloudfolder/a;

    .line 129
    .line 130
    invoke-virtual {v0, p1}, Lcom/android/launcher3/cloudfolder/a;->j(Landroid/view/MotionEvent;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-nez p1, :cond_6

    .line 135
    .line 136
    const-string p1, "Launcher.Folder"

    .line 137
    .line 138
    const-string v0, "onControllerInterceptTouchEvent: touch folder empty space, close foler."

    .line 139
    .line 140
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, v3}, Lcom/android/launcher3/a;->close(Z)V

    .line 144
    .line 145
    .line 146
    return v3

    .line 147
    :cond_6
    return v2
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/ExtendedEditText;->l(Landroid/view/View$OnFocusChangeListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x6

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/ExtendedEditText;->h()V

    .line 7
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

.method protected onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget v1, v0, Lcom/android/launcher3/h0;->T1:I

    .line 11
    .line 12
    const v1, 0x7f0b027c

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/launcher3/folder/FolderPagedView;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Lcom/android/launcher3/folder/FolderPagedView;->setFolder(Lcom/android/launcher3/folder/Folder;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 27
    .line 28
    iget v1, v1, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/launcher3/folder/Folder;->A0:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 37
    .line 38
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->A0:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const v3, 0x7f07034f

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 71
    .line 72
    .line 73
    :cond_0
    const v1, 0x7f0b027f

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 81
    .line 82
    iget v0, v0, Lcom/android/launcher3/h0;->P1:I

    .line 83
    .line 84
    iput v0, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 85
    .line 86
    const v0, 0x7f0b0282

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/android/launcher3/folder/FolderNameEditText;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 96
    .line 97
    invoke-virtual {v0, p0}, Lcom/android/launcher3/ExtendedEditText;->setOnBackKeyListener(Lcom/android/launcher3/ExtendedEditText$a;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 106
    .line 107
    const/4 v1, 0x1

    .line 108
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/widget/EditText;->getInputType()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    const v3, -0x8001

    .line 118
    .line 119
    .line 120
    and-int/2addr v2, v3

    .line 121
    const v3, 0x82000

    .line 122
    .line 123
    .line 124
    or-int/2addr v2, v3

    .line 125
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lcom/android/launcher3/ExtendedEditText;->i(Z)V

    .line 131
    .line 132
    .line 133
    new-instance v0, Lcom/android/launcher3/anim/M;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Lcom/android/launcher3/anim/M;-><init>(Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->U:Lcom/android/launcher3/anim/M;

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setWindowInsetsAnimationCallback(Landroid/view/WindowInsetsAnimation$Callback;)V

    .line 141
    .line 142
    .line 143
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_1

    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    const v2, 0x7f070365

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 169
    .line 170
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 171
    .line 172
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->K1()V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    if-ne p1, v0, :cond_6

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/folder/Folder;->L1()V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {p2}, Landroid/text/Editable;->length()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-static {p1, v0, p2}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->H()Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->s:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->r:Ljava/lang/CharSequence;

    .line 58
    .line 59
    new-instance p1, Lcom/android/launcher3/folder/v;

    .line 60
    .line 61
    invoke-direct {p1, p0}, Lcom/android/launcher3/folder/v;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->T:Lcom/android/launcher3/logging/StatsLogManager;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 75
    .line 76
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->s:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 81
    .line 82
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withFromState(Lcom/android/launcher3/logger/LauncherAtom$FromState;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance p2, Ljava/util/StringJoiner;

    .line 87
    .line 88
    sget-object v0, Lcom/android/launcher3/folder/Folder;->F0:Ljava/lang/CharSequence;

    .line 89
    .line 90
    invoke-direct {p2, v0}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->s:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 94
    .line 95
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$FromState;->FROM_SUGGESTED:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->r:Ljava/lang/CharSequence;

    .line 104
    .line 105
    invoke-virtual {p2, v0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->r:Ljava/lang/CharSequence;

    .line 109
    .line 110
    if-eqz v0, :cond_3

    .line 111
    .line 112
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    sget-object v0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->UNCHANGED:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->J()Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-string v2, "TO_SUGGESTION"

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_4

    .line 142
    .line 143
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 144
    .line 145
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 146
    .line 147
    invoke-virtual {p2, v1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 148
    .line 149
    .line 150
    :cond_4
    :goto_0
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withToState(Lcom/android/launcher3/logger/LauncherAtom$ToState;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2}, Ljava/util/StringJoiner;->length()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-lez v0, :cond_5

    .line 158
    .line 159
    invoke-virtual {p2}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withEditText(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 164
    .line 165
    .line 166
    :cond_5
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$e;->v:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 167
    .line 168
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/android/launcher3/ExtendedEditText;->h()V

    .line 174
    .line 175
    .line 176
    :cond_6
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 8
    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/folder/Folder;->r1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/16 v1, 0xa

    .line 38
    .line 39
    if-le v0, v1, :cond_4

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x1

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    if-eq v0, v1, :cond_1

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    if-eq v0, v1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iput-boolean v2, p0, Lcom/android/launcher3/folder/Folder;->E0:Z

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->E0:Z

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->animateOpen()V

    .line 63
    .line 64
    .line 65
    iput-boolean v2, p0, Lcom/android/launcher3/folder/Folder;->E0:Z

    .line 66
    .line 67
    return v1

    .line 68
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_3
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->E0:Z

    .line 74
    .line 75
    :cond_4
    :goto_1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    return p0
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->P1(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIsLauncherDraggingEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    new-instance v0, Lcom/android/launcher3/dragndrop/p;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/folder/Folder;->m2(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method protected onMeasure(II)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaWidth()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 20
    .line 21
    invoke-virtual {v4, p1, v0}, Lcom/android/launcher3/folder/FolderPagedView;->s0(II)V

    .line 22
    .line 23
    .line 24
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 25
    .line 26
    invoke-virtual {v4, v2, v3}, Landroid/view/ViewGroup;->measure(II)V

    .line 27
    .line 28
    .line 29
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Lcom/android/launcher3/h0;->T0()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_0

    .line 40
    .line 41
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 48
    .line 49
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->N0:Z

    .line 54
    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    :cond_0
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->q0:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    iget v5, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 62
    .line 63
    add-int/2addr v5, v0

    .line 64
    invoke-static {v5, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    invoke-virtual {v4, v2, v5}, Landroid/widget/LinearLayout;->measure(II)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v5, "measure--mFolderLandWrap is null--orientation: "

    .line 78
    .line 79
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    iget v5, v5, Landroid/content/res/Configuration;->orientation:I

    .line 91
    .line 92
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    const-string v5, "Launcher.Folder"

    .line 100
    .line 101
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    :cond_2
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {v4, v2, v3}, Landroid/view/View;->measure(II)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 110
    .line 111
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->x:I

    .line 112
    .line 113
    invoke-static {v4, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    invoke-virtual {v3, v2, v4}, Landroid/view/View;->measure(II)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    add-int/2addr v2, v3

    .line 129
    add-int/2addr v2, p1

    .line 130
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->g1(I)I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    invoke-virtual {p0, v2, p1}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 138
    .line 139
    if-eqz p1, :cond_3

    .line 140
    .line 141
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 146
    .line 147
    invoke-interface {v0, p0, p1, p2}, Lcom/android/launcher3/folder/Folder$k;->e(Lcom/android/launcher3/folder/Folder;II)V

    .line 148
    .line 149
    .line 150
    :cond_3
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const p2, 0x7f070364

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/widget/EditText;->getMeasuredWidth()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-ge p2, p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 30
    .line 31
    const/16 p1, 0x8

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "Launcher.Folder"

    .line 6
    .line 7
    const-string p1, "onTouchEvent: mIsOpen=false , return false !!!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/a;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method protected p1()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ld1/c;->b(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 16
    .line 17
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-lt p0, v0, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x5

    .line 23
    if-eq p0, v1, :cond_0

    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public q1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/Folder;->P:Z

    .line 2
    .line 3
    return p0
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 8

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-eqz p3, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-gt v3, v1, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 13
    .line 14
    :cond_0
    iget-boolean v3, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 15
    .line 16
    if-eqz v3, :cond_4

    .line 17
    .line 18
    iget-boolean v3, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 19
    .line 20
    if-nez v3, :cond_4

    .line 21
    .line 22
    if-eq p1, p0, :cond_4

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Y1()V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v3, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 31
    .line 32
    if-eqz v4, :cond_2

    .line 33
    .line 34
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    if-ne v4, v3, :cond_2

    .line 39
    .line 40
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 44
    .line 45
    invoke-virtual {v4, v3}, Lcom/android/launcher3/folder/FolderPagedView;->e0(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-nez v6, :cond_4

    .line 58
    .line 59
    iget v6, v3, Lcom/android/launcher3/model/data/y;->rank:I

    .line 60
    .line 61
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    invoke-static {v6, v2, v7}, Lcom/android/launcher3/N5;->c(III)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    iput v6, v3, Lcom/android/launcher3/model/data/y;->rank:I

    .line 70
    .line 71
    invoke-virtual {v5, v6, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-ne v3, v0, :cond_3

    .line 79
    .line 80
    const-string v3, "Launcher.Folder"

    .line 81
    .line 82
    const-string v6, "reset icon Visibility"

    .line 83
    .line 84
    invoke-static {v3, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object v3, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 91
    .line 92
    invoke-virtual {v3, v5}, Lcom/android/launcher3/folder/FolderPagedView;->X(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 96
    .line 97
    new-instance v3, Lcom/android/launcher3/folder/w;

    .line 98
    .line 99
    invoke-direct {v3, p0, p2}, Lcom/android/launcher3/folder/w;-><init>(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/n0$a;)V

    .line 100
    .line 101
    .line 102
    invoke-direct {p0, v3}, Lcom/android/launcher3/folder/Folder;->b1(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_1
    if-eq p1, p0, :cond_6

    .line 106
    .line 107
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/android/launcher3/c;->a()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 118
    .line 119
    .line 120
    if-nez p3, :cond_5

    .line 121
    .line 122
    iput-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->L:Z

    .line 123
    .line 124
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->V0()V

    .line 130
    .line 131
    .line 132
    :cond_6
    iput-boolean v2, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 133
    .line 134
    iput-boolean v2, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 135
    .line 136
    iput-boolean v2, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 137
    .line 138
    const/4 p1, 0x0

    .line 139
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 140
    .line 141
    invoke-virtual {p0, v2}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    iget-object p3, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 149
    .line 150
    invoke-virtual {p3}, Lcom/android/launcher3/folder/FolderPagedView;->l0()I

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    if-gt p1, p3, :cond_7

    .line 155
    .line 156
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 157
    .line 158
    iget-object p3, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 159
    .line 160
    invoke-virtual {p3}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    invoke-virtual {p1, v0, v2, p3}, Lcom/android/launcher3/model/data/p;->P(IZLz1/J3;)V

    .line 165
    .line 166
    .line 167
    :cond_7
    sget-object p1, Lf1/a;->x:Lf1/a$a;

    .line 168
    .line 169
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_8

    .line 174
    .line 175
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseatDivideAnimation()Lp1/a;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0, p2, v2}, Lp1/a;->g(Lcom/android/launcher3/n0$a;Z)V

    .line 190
    .line 191
    .line 192
    :cond_8
    return-void
.end method

.method public r1(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    float-to-int p0, p0

    .line 44
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    float-to-int p1, p1

    .line 49
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method

.method public r2(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/folder/A;->b(Lcom/android/launcher3/h0;)Lcom/android/launcher3/folder/A;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x0

    .line 33
    move v4, v3

    .line 34
    :goto_0
    if-ge v4, v2, :cond_2

    .line 35
    .line 36
    iget-object v5, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 37
    .line 38
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    invoke-virtual {v0, v5, v4}, Lcom/android/launcher3/folder/A;->m(Lcom/android/launcher3/model/data/y;I)Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-eqz v6, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    if-nez p1, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_1

    .line 65
    .line 66
    iget-object v6, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 67
    .line 68
    invoke-interface {v6}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    iget-boolean v6, v6, Lcom/android/launcher3/X3;->B0:Z

    .line 73
    .line 74
    if-eqz v6, :cond_1

    .line 75
    .line 76
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 95
    .line 96
    iget v4, v4, Lcom/android/launcher3/model/data/y;->id:I

    .line 97
    .line 98
    invoke-virtual {v0, v1, v4, v3}, Lz1/J3;->U(Ljava/util/ArrayList;II)V

    .line 99
    .line 100
    .line 101
    :cond_3
    if-nez p1, :cond_4

    .line 102
    .line 103
    const/4 p1, 0x1

    .line 104
    if-le v2, p1, :cond_4

    .line 105
    .line 106
    new-instance p1, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    monitor-enter v0

    .line 118
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 125
    .line 126
    .line 127
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 129
    .line 130
    new-instance v1, Lcom/android/launcher3/folder/m;

    .line 131
    .line 132
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/folder/m;-><init>(Lcom/android/launcher3/folder/Folder;Ljava/util/ArrayList;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :catchall_0
    move-exception p0

    .line 140
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    throw p0

    .line 142
    :cond_4
    return-void
.end method

.method public s1(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    float-to-int p0, p0

    .line 24
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    float-to-int p1, p1

    .line 29
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public s2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getFirstItem()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderPagedView;->getLastItem()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setNextFocusDownId(I)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setNextFocusRightId(I)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setNextFocusLeftId(I)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setNextFocusUpId(I)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setNextFocusForwardId(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setNextFocusDownId(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setNextFocusRightId(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setNextFocusLeftId(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setNextFocusUpId(I)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Lcom/android/launcher3/folder/Folder$i;

    .line 91
    .line 92
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/folder/Folder$i;-><init>(Lcom/android/launcher3/folder/Folder;Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_0
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public setClipPath(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->B:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setCurrentDragView(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method setDeleteFolderOnDropCompleted(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->K:Z

    .line 2
    .line 3
    return-void
.end method

.method setDragController(Lcom/android/launcher3/dragndrop/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->p:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    return-void
.end method

.method public setFolderBackground(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setFolderBackground: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Launcher.Folder"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const v2, 0x7f040781

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    const/16 v1, 0xff

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 v1, 0x0

    .line 48
    :goto_0
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->p0:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sget-object p1, Lcom/android/launcher3/G2;->a:Landroid/util/IntProperty;

    .line 75
    .line 76
    filled-new-array {v1}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-wide/16 v0, 0x96

    .line 85
    .line 86
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public setFolderIcon(Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/folder/g0;->g(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/folder/FolderIcon;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method setFolderName(Lcom/android/launcher3/folder/FolderNameEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 2
    .line 3
    return-void
.end method

.method public setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->e0:Lcom/android/launcher3/globalsearch/r$b;

    .line 2
    .line 3
    return-void
.end method

.method setIsDragInProgress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 2
    .line 3
    return-void
.end method

.method setIsEditingName(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->O:Z

    .line 2
    .line 3
    return-void
.end method

.method setIsExternalDrag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method setIsOpen(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    return-void
.end method

.method setItemAddedBackToSelfViaIcon(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method setItemsInvalidated(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 2
    .line 3
    return-void
.end method

.method setOnExitAlarm(Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->h:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-void
.end method

.method setOnScrollHintAlarm(Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-void
.end method

.method public setPriorityOnFolderStateChangedListener(Lcom/android/launcher3/folder/Folder$m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->E:Lcom/android/launcher3/folder/Folder$m;

    .line 2
    .line 3
    return-void
.end method

.method setRearrangeOnClose(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 2
    .line 3
    return-void
.end method

.method setReorderAlarm(Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-void
.end method

.method setScrollHintDir(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->R:I

    .line 2
    .line 3
    return-void
.end method

.method setScrollPauseAlarm(Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 2
    .line 3
    return-void
.end method

.method setState(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->E:Lcom/android/launcher3/folder/Folder$m;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Lcom/android/launcher3/folder/Folder$m;->a(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder;->D:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/folder/Folder$m;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget v1, p0, Lcom/android/launcher3/folder/Folder;->C:I

    .line 31
    .line 32
    invoke-interface {v0, v1}, Lcom/android/launcher3/folder/Folder$m;->a(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return-void
.end method

.method public setSuppressFolderDeletion(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/Folder;->L:Z

    .line 2
    .line 3
    return-void
.end method

.method public varargs t(Z[Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public v()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->V0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/android/launcher3/folder/Folder;->y0:Z

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/folder/Folder;->C0(ZZ)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/folder/Folder;->y0:Z

    .line 28
    .line 29
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->setFolderBackground(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->setForceHideDot(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method v1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->O0:Z

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->V:Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    if-ne p1, p0, :cond_0

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

.method public w1(Lcom/android/launcher3/util/Y0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 10

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onDrop: DragObject: "

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 17
    .line 18
    iget v0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "Launcher.Folder"

    .line 28
    .line 29
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 33
    .line 34
    const/16 v0, 0x20

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 43
    .line 44
    iget p2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 47
    .line 48
    iget v0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 49
    .line 50
    if-eq p2, v0, :cond_0

    .line 51
    .line 52
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 59
    .line 60
    invoke-static {p2, v0}, Lcom/android/launcher3/resource/h1;->L(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p2}, Lcom/android/launcher3/G4;->q()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_1

    .line 78
    .line 79
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->H1(Lcom/android/launcher3/n0$a;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->f2(Lcom/android/launcher3/n0$a;)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 87
    .line 88
    iget v0, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 89
    .line 90
    invoke-virtual {p2, v0}, Lcom/android/launcher3/folder/FolderPagedView;->p0(I)Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    const/4 v0, 0x0

    .line 95
    if-nez p2, :cond_2

    .line 96
    .line 97
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/folder/Folder;->k1(Lcom/android/launcher3/n0$a;[F)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    iput p2, p0, Lcom/android/launcher3/folder/Folder;->y:I

    .line 102
    .line 103
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/Folder;->J1(Lcom/android/launcher3/n0$a;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->W:Lcom/android/launcher3/L4;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->g:Lcom/android/launcher3/c;

    .line 109
    .line 110
    invoke-interface {p2, v1}, Lcom/android/launcher3/L4;->a(Lcom/android/launcher3/c;)V

    .line 111
    .line 112
    .line 113
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->i:Lcom/android/launcher3/c;

    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/android/launcher3/c;->b()V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->j:Lcom/android/launcher3/c;

    .line 119
    .line 120
    invoke-virtual {p2}, Lcom/android/launcher3/c;->b()V

    .line 121
    .line 122
    .line 123
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 124
    .line 125
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderPagedView;->b0()V

    .line 126
    .line 127
    .line 128
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 129
    .line 130
    invoke-virtual {p2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    if-nez v1, :cond_3

    .line 135
    .line 136
    return-void

    .line 137
    :cond_3
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 138
    .line 139
    instance-of v2, p2, Lcom/android/launcher3/widget/y0;

    .line 140
    .line 141
    if-eqz v2, :cond_4

    .line 142
    .line 143
    check-cast p2, Lcom/android/launcher3/widget/y0;

    .line 144
    .line 145
    move-object v2, p2

    .line 146
    goto :goto_0

    .line 147
    :cond_4
    move-object v2, v0

    .line 148
    :goto_0
    if-eqz v2, :cond_5

    .line 149
    .line 150
    invoke-virtual {v2, v1}, Lcom/android/launcher3/widget/y0;->P(Landroid/content/Context;)LD1/i;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-virtual {p2}, LD1/i;->c()Lcom/android/launcher3/model/data/I;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    goto :goto_1

    .line 159
    :cond_5
    move-object p2, v0

    .line 160
    :goto_1
    const/4 v8, 0x1

    .line 161
    const/4 v9, 0x0

    .line 162
    if-eqz v2, :cond_6

    .line 163
    .line 164
    if-nez p2, :cond_6

    .line 165
    .line 166
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 167
    .line 168
    iget v3, p2, Lcom/android/launcher3/model/data/y;->id:I

    .line 169
    .line 170
    iput v3, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 171
    .line 172
    iget p2, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 173
    .line 174
    iput p2, v2, Lcom/android/launcher3/model/data/y;->rank:I

    .line 175
    .line 176
    iget v4, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 177
    .line 178
    iget v6, v2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 179
    .line 180
    iget v7, v2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 181
    .line 182
    const/4 v5, 0x0

    .line 183
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/C2;->Y0(Lcom/android/launcher3/W4;II[III)V

    .line 184
    .line 185
    .line 186
    iput-boolean v9, p1, Lcom/android/launcher3/n0$a;->k:Z

    .line 187
    .line 188
    iput-boolean v8, p0, Lcom/android/launcher3/folder/Folder;->F:Z

    .line 189
    .line 190
    goto/16 :goto_6

    .line 191
    .line 192
    :cond_6
    if-eqz p2, :cond_8

    .line 193
    .line 194
    :cond_7
    :goto_2
    move-object v3, p2

    .line 195
    goto :goto_3

    .line 196
    :cond_8
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 197
    .line 198
    instance-of v2, p2, Lcom/android/launcher3/model/data/F;

    .line 199
    .line 200
    if-eqz v2, :cond_7

    .line 201
    .line 202
    check-cast p2, Lcom/android/launcher3/model/data/F;

    .line 203
    .line 204
    invoke-interface {p2, v1}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    goto :goto_2

    .line 209
    :goto_3
    iget-boolean p2, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 210
    .line 211
    if-eqz p2, :cond_a

    .line 212
    .line 213
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 214
    .line 215
    iget v2, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 216
    .line 217
    invoke-virtual {p2, v3, v2}, Lcom/android/launcher3/folder/FolderPagedView;->d0(Lcom/android/launcher3/model/data/y;I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v2}, Lcom/android/launcher3/q4;->a0()Z

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    if-eqz v2, :cond_9

    .line 230
    .line 231
    instance-of v2, p2, Lcom/android/launcher3/BubbleTextView;

    .line 232
    .line 233
    if-eqz v2, :cond_9

    .line 234
    .line 235
    move-object v2, p2

    .line 236
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 237
    .line 238
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    invoke-static {v5}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    const v6, 0x7f040781

    .line 251
    .line 252
    .line 253
    invoke-static {v4, v6, v5}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    invoke-virtual {v2, v4}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 258
    .line 259
    .line 260
    :cond_9
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 261
    .line 262
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    iget-object v4, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 267
    .line 268
    iget v4, v4, Lcom/android/launcher3/model/data/y;->id:I

    .line 269
    .line 270
    iget v6, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 271
    .line 272
    iget v7, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 273
    .line 274
    const/4 v5, 0x0

    .line 275
    invoke-virtual/range {v2 .. v7}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 276
    .line 277
    .line 278
    iput-boolean v9, p0, Lcom/android/launcher3/folder/Folder;->I:Z

    .line 279
    .line 280
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 281
    .line 282
    if-eq v2, p0, :cond_b

    .line 283
    .line 284
    invoke-virtual {p0, v9}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 285
    .line 286
    .line 287
    goto :goto_4

    .line 288
    :cond_a
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->H:Landroid/view/View;

    .line 289
    .line 290
    iget-object v2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 291
    .line 292
    iget v4, p0, Lcom/android/launcher3/folder/Folder;->A:I

    .line 293
    .line 294
    invoke-virtual {v2, p2, v3, v4}, Lcom/android/launcher3/folder/FolderPagedView;->V(Landroid/view/View;Lcom/android/launcher3/model/data/y;I)V

    .line 295
    .line 296
    .line 297
    :cond_b
    :goto_4
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 298
    .line 299
    invoke-virtual {v2}, Lcom/android/launcher3/dragndrop/v;->u()Z

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    if-eqz v2, :cond_c

    .line 304
    .line 305
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleX()F

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleY()F

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    const/high16 v5, 0x3f800000    # 1.0f

    .line 314
    .line 315
    invoke-virtual {p0, v5}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0, v5}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 322
    .line 323
    .line 324
    move-result-object v5

    .line 325
    iget-object v6, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 326
    .line 327
    invoke-virtual {v5, v6, p2, v0}, Lcom/android/launcher3/dragndrop/DragLayer;->i(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;Landroid/view/View;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 334
    .line 335
    .line 336
    goto :goto_5

    .line 337
    :cond_c
    iput-boolean v9, p1, Lcom/android/launcher3/n0$a;->k:Z

    .line 338
    .line 339
    invoke-virtual {p2, v9}, Landroid/view/View;->setVisibility(I)V

    .line 340
    .line 341
    .line 342
    :goto_5
    iput-boolean v8, p0, Lcom/android/launcher3/folder/Folder;->G:Z

    .line 343
    .line 344
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 345
    .line 346
    .line 347
    new-instance p2, Lcom/android/launcher3/folder/h;

    .line 348
    .line 349
    invoke-direct {p2, p0, v3}, Lcom/android/launcher3/folder/h;-><init>(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;)V

    .line 350
    .line 351
    .line 352
    invoke-direct {p0, p2}, Lcom/android/launcher3/folder/Folder;->b1(Ljava/lang/Runnable;)V

    .line 353
    .line 354
    .line 355
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 356
    .line 357
    if-eq p2, p0, :cond_d

    .line 358
    .line 359
    invoke-virtual {p0, v9}, Lcom/android/launcher3/folder/Folder;->r2(Z)V

    .line 360
    .line 361
    .line 362
    :cond_d
    :goto_6
    iput-boolean v9, p0, Lcom/android/launcher3/folder/Folder;->J:Z

    .line 363
    .line 364
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 365
    .line 366
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 367
    .line 368
    .line 369
    move-result p2

    .line 370
    if-le p2, v8, :cond_e

    .line 371
    .line 372
    iget-object p2, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 373
    .line 374
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 375
    .line 376
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->f()Lz1/J3;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    const/4 v2, 0x4

    .line 381
    invoke-virtual {p2, v2, v8, v0}, Lcom/android/launcher3/model/data/p;->P(IZLz1/J3;)V

    .line 382
    .line 383
    .line 384
    :cond_e
    sget-object p2, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 385
    .line 386
    invoke-interface {v1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 387
    .line 388
    .line 389
    move-result p2

    .line 390
    if-nez p2, :cond_f

    .line 391
    .line 392
    sget-object p2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 393
    .line 394
    invoke-interface {v1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 395
    .line 396
    .line 397
    move-result p2

    .line 398
    if-eqz p2, :cond_f

    .line 399
    .line 400
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 401
    .line 402
    .line 403
    move-result-object p2

    .line 404
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 405
    .line 406
    const-wide/16 v1, 0x1f4

    .line 407
    .line 408
    invoke-virtual {p2, v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->I(Lcom/android/launcher3/statemanager/a;J)V

    .line 409
    .line 410
    .line 411
    :cond_f
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 412
    .line 413
    if-eqz p2, :cond_10

    .line 414
    .line 415
    const v0, 0x7f140219

    .line 416
    .line 417
    .line 418
    invoke-virtual {p2, v0}, LO0/e;->c(I)V

    .line 419
    .line 420
    .line 421
    :cond_10
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->T:Lcom/android/launcher3/logging/StatsLogManager;

    .line 422
    .line 423
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 428
    .line 429
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 434
    .line 435
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 436
    .line 437
    .line 438
    move-result-object p0

    .line 439
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->p:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 440
    .line 441
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 442
    .line 443
    .line 444
    return-void
.end method

.method public z0(Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->z0:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
