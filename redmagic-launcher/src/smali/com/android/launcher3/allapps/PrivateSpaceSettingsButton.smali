.class public Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;
.super Landroid/widget/ImageButton;
.source "PrivateSpaceSettingsButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final g:Lcom/android/launcher3/views/k;

.field private final h:Lcom/android/launcher3/logging/StatsLogManager;

.field private final i:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    iput-object p2, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->g:Lcom/android/launcher3/views/k;

    .line 4
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->h:Lcom/android/launcher3/logging/StatsLogManager;

    .line 5
    sget-object p2, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 6
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/util/f;

    invoke-virtual {p1}, Lcom/android/launcher3/util/f;->i()Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->i:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method a()Lcom/android/launcher3/model/data/d;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/d;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, -0x6e

    .line 7
    .line 8
    iput v1, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->i:Landroid/content/Intent;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object p0, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 19
    .line 20
    :cond_0
    iput v1, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 21
    .line 22
    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->h:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->g3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->a()Lcom/android/launcher3/model/data/d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->g:Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/allapps/PrivateSpaceSettingsButton;->i:Landroid/content/Intent;

    .line 22
    .line 23
    invoke-interface {v1, p1, p0, v0}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/ImageButton;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
