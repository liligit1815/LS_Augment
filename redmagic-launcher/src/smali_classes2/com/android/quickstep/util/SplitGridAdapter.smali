.class public Lcom/android/quickstep/util/SplitGridAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SplitGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/quickstep/util/SplitViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SplitGridAdapter"


# instance fields
.field private mActivity:Lcom/android/quickstep/SplitActivity;

.field private mAppItemInfosList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field

.field private final mGridLayoutMgr:Landroidx/recyclerview/widget/GridLayoutManager;

.field private final mGridSizer:Lcom/android/quickstep/util/GridSpanSizer;

.field private mIconFocusListener:Landroid/view/View$OnFocusChangeListener;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private final mSplitAppsPerRow:I


# direct methods
.method public constructor <init>(Lcom/android/quickstep/SplitActivity;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mAppItemInfosList:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    .line 12
    .line 13
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 18
    .line 19
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-direct {v0, p1, v1, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mGridLayoutMgr:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 27
    .line 28
    const/4 p1, 0x4

    .line 29
    iput p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mSplitAppsPerRow:I

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->K0(I)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Lcom/android/quickstep/util/GridSpanSizer;

    .line 35
    .line 36
    invoke-direct {p1}, Lcom/android/quickstep/util/GridSpanSizer;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mGridSizer:Lcom/android/quickstep/util/GridSpanSizer;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->L0(Landroidx/recyclerview/widget/GridLayoutManager$d;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/util/SplitGridAdapter;Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/SplitGridAdapter;->lambda$onCreateViewHolder$0(Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onCreateViewHolder$0(Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/c1;->C(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    .line 37
    .line 38
    iget-object p1, v0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 39
    .line 40
    invoke-virtual {p0, p2, p1, v0}, Lcom/android/quickstep/SplitActivity;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string p2, "startActivitySafely user match--success:"

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "SplitGridAdapter"

    .line 62
    .line 63
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-eqz p0, :cond_0

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Lh1/a;->K(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method


# virtual methods
.method public getGridLayoutMgr()Landroidx/recyclerview/widget/GridLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mGridLayoutMgr:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mAppItemInfosList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/util/SplitViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitGridAdapter;->onBindViewHolder(Lcom/android/quickstep/util/SplitViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/quickstep/util/SplitViewHolder;I)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mAppItemInfosList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/model/data/d;

    if-nez p2, :cond_0

    return-void

    .line 3
    :cond_0
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 4
    invoke-virtual {v0, p2}, Lcom/android/launcher3/BubbleTextView;->v(Lcom/android/launcher3/model/data/d;)V

    .line 5
    iget-object p2, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iget-object p0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    move-result p0

    const v1, 0x7f040781

    .line 7
    invoke-static {p2, v1, p0}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 8
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    move-object p1, p0

    check-cast p1, Landroid/widget/TextView;

    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p0

    const/4 p2, -0x1

    if-ne p2, p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    invoke-static {p1, p0}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitGridAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/quickstep/util/SplitViewHolder;

    move-result-object p0

    return-object p0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/quickstep/util/SplitViewHolder;
    .locals 2

    .line 2
    iget-object p2, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f0e0209

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p2, v0}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 4
    new-instance v0, Lcom/android/quickstep/util/R0;

    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/util/R0;-><init>(Lcom/android/quickstep/util/SplitGridAdapter;Landroid/view/ViewGroup;)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mIconFocusListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 6
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget-object p0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p0

    iget p0, p0, Lcom/android/launcher3/h0;->H2:I

    iput p0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 7
    new-instance p0, Lcom/android/quickstep/util/SplitViewHolder;

    invoke-direct {p0, p2}, Lcom/android/quickstep/util/SplitViewHolder;-><init>(Landroid/view/View;)V

    return-object p0
.end method

.method public onForeColorChanged(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mAppItemInfosList:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mAppItemInfosList:Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setIconFocusListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mIconFocusListener:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 p4, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    move-object v0, p4

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 7
    .line 8
    :goto_0
    const/high16 v1, 0x10000000

    .line 9
    .line 10
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    :try_start_0
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v1, v0, p4, p4}, Landroid/content/pm/LauncherApps;->startMainActivity(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/graphics/Rect;Landroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    goto :goto_2

    .line 46
    :catch_0
    move-exception p1

    .line 47
    goto :goto_3

    .line 48
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    .line 49
    .line 50
    invoke-virtual {p1, p2, p4}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :goto_2
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :goto_3
    iget-object p0, p0, Lcom/android/quickstep/util/SplitGridAdapter;->mActivity:Lcom/android/quickstep/SplitActivity;

    .line 56
    .line 57
    const p4, 0x7f140047

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-static {p0, p4, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 66
    .line 67
    .line 68
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string p4, "Unable to launch. tag="

    .line 74
    .line 75
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p3, " intent="

    .line 82
    .line 83
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p2, "SplitGridAdapter"

    .line 94
    .line 95
    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    .line 97
    .line 98
    return v0
.end method
