.class public Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;
.super Lcom/android/launcher3/graphics/FragmentWithPreview;
.source "QsbContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/qsb/QsbContainerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QsbFragment"
.end annotation


# instance fields
.field protected h:Ljava/lang/String;

.field private i:Lcom/android/launcher3/qsb/QsbContainerView$a;

.field protected j:Landroid/appwidget/AppWidgetProviderInfo;

.field private k:Lcom/android/launcher3/qsb/g;

.field private l:I

.field private m:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "qsb_widget_id"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->h:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Landroid/content/Context;)Lcom/android/launcher3/qsb/g;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/qsb/g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/qsb/g;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic d(Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->l(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->f()Landroid/os/Bundle;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    iget-object v5, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->h:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v6, -0x1

    .line 34
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {v3, v4}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const/4 v7, 0x1

    .line 43
    if-eqz v5, :cond_1

    .line 44
    .line 45
    iget-object v5, v5, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 46
    .line 47
    iget-object v8, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 48
    .line 49
    iget-object v8, v8, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 50
    .line 51
    invoke-virtual {v5, v8}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_1

    .line 56
    .line 57
    move v1, v7

    .line 58
    :cond_1
    if-nez v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->a()Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-nez v5, :cond_5

    .line 65
    .line 66
    if-le v4, v6, :cond_2

    .line 67
    .line 68
    iget-object v1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 69
    .line 70
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHost;->deleteHost()V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHost;->allocateAppWidgetId()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iget-object v5, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 80
    .line 81
    invoke-virtual {v5}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    iget-object v8, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 86
    .line 87
    iget-object v8, v8, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 88
    .line 89
    invoke-virtual {v3, v1, v5, v8, v0}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/os/Bundle;)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_3

    .line 94
    .line 95
    iget-object v5, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 96
    .line 97
    invoke-virtual {v5, v1}, Landroid/appwidget/AppWidgetHost;->deleteAppWidgetId(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    move v6, v1

    .line 102
    :goto_0
    if-eq v4, v6, :cond_4

    .line 103
    .line 104
    invoke-direct {p0, v6}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->n(I)V

    .line 105
    .line 106
    .line 107
    :cond_4
    move v1, v3

    .line 108
    move v4, v6

    .line 109
    :cond_5
    if-eqz v1, :cond_7

    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 114
    .line 115
    invoke-virtual {p1, v2, v4, v1}, Landroid/appwidget/AppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Lcom/android/launcher3/qsb/g;

    .line 120
    .line 121
    iput-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->k:Lcom/android/launcher3/qsb/g;

    .line 122
    .line 123
    const v1, 0x7f0b04a7

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v1}, Landroid/appwidget/AppWidgetHostView;->setId(I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->a()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-nez p1, :cond_6

    .line 134
    .line 135
    invoke-static {v2}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, v4}, Landroid/appwidget/AppWidgetManager;->getAppWidgetOptions(I)Landroid/os/Bundle;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p1, v0}, Lcom/android/launcher3/qsb/QsbContainerView;->a(Landroid/os/Bundle;Landroid/os/Bundle;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-nez p1, :cond_6

    .line 148
    .line 149
    iget-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->k:Lcom/android/launcher3/qsb/g;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/appwidget/AppWidgetHostView;->updateAppWidgetOptions(Landroid/os/Bundle;)V

    .line 152
    .line 153
    .line 154
    :cond_6
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->k:Lcom/android/launcher3/qsb/g;

    .line 155
    .line 156
    return-object p0

    .line 157
    :cond_7
    invoke-virtual {p0, p1, v7}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "android.appwidget.action.APPWIDGET_BIND"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->allocateAppWidgetId()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "appWidgetId"

    .line 15
    .line 16
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 21
    .line 22
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 23
    .line 24
    const-string v1, "appWidgetProvider"

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-virtual {p0, p1, v0}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private m()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->k()Z

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
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->h(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method private n(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->h:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public b(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->g()Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 20
    .line 21
    iput p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->l:I

    .line 22
    .line 23
    return-void
.end method

.method protected f()Landroid/os/Bundle;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->j:Landroid/appwidget/AppWidgetProviderInfo;

    .line 14
    .line 15
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 16
    .line 17
    iget v0, v0, Lcom/android/launcher3/F1;->H0:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-static {v1, p0, v0, v2}, Lr2/b;->d(Landroid/content/Context;Landroid/content/ComponentName;II)Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method protected g()Lcom/android/launcher3/qsb/QsbContainerView$a;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Lcom/android/launcher3/qsb/a;

    .line 8
    .line 9
    invoke-direct {v2}, Lcom/android/launcher3/qsb/a;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v3, Lcom/android/launcher3/qsb/b;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Lcom/android/launcher3/qsb/b;-><init>(Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0x402

    .line 18
    .line 19
    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/launcher3/qsb/QsbContainerView$a;-><init>(Landroid/content/Context;ILcom/android/launcher3/qsb/QsbContainerView$c;Lcom/android/launcher3/qsb/QsbContainerView$b;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method protected i(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/qsb/g;->q(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const p2, 0x7f0b0127

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/qsb/c;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/android/launcher3/qsb/c;-><init>(Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object p1
.end method

.method protected j()Landroid/appwidget/AppWidgetProviderInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/qsb/QsbContainerView;->f(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_1

    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    const-string p2, "appWidgetId"

    .line 8
    .line 9
    invoke-virtual {p3, p2, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->n(I)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHost;->deleteHost()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/graphics/FragmentWithPreview;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->k()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHost;->startListening()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->h(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    return-object p0
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->i:Lcom/android/launcher3/qsb/QsbContainerView$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->stopListening()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->k:Lcom/android/launcher3/qsb/g;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v1, p0, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->l:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/qsb/g;->r(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/qsb/QsbContainerView$QsbFragment;->m()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
