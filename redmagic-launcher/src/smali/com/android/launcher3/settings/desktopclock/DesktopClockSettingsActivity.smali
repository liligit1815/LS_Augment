.class public Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;
.super Landroid/app/Activity;
.source "DesktopClockSettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;


# instance fields
.field private g:Landroid/content/Context;

.field private h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

.field private i:Landroid/widget/ImageView;

.field private j:Lcom/android/launcher3/settings/desktopclock/MenuEffectView;

.field private k:Landroid/widget/LinearLayout;

.field private l:Landroid/widget/ImageView;

.field private m:Landroid/widget/TextView;

.field private n:Z

.field private o:I

.field private p:Landroid/view/animation/Animation;

.field private q:Landroid/view/animation/Animation;

.field private r:Z

.field private s:Ljava/lang/String;

.field private final t:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LL1/a;",
            ">;"
        }
    .end annotation
.end field

.field private final u:Landroid/view/animation/PathInterpolator;

.field private v:Landroid/view/animation/Animation$AnimationListener;

.field private w:Landroid/view/animation/Animation$AnimationListener;

.field private final x:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

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
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->t:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/high16 v2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-direct {v0, v1, v1, v2, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->u:Landroid/view/animation/PathInterpolator;

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$d;-><init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->v:Landroid/view/animation/Animation$AnimationListener;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$e;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$e;-><init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->w:Landroid/view/animation/Animation$AnimationListener;

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$f;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$f;-><init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->x:Landroid/content/BroadcastReceiver;

    .line 41
    .line 42
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->s(ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->j:Lcom/android/launcher3/settings/desktopclock/MenuEffectView;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->b()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method private g()Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    const-string p0, "DesktopClockSettingsActivity"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "screenshot"

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getForeColor()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v4, "com.zte.mifavor.launcher"

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-virtual {v2, v3, v1, v4, v5}, Lcom/android/launcher3/q4;->g(Ljava/lang/String;ILjava/lang/String;Z)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    :try_start_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-object v1

    .line 38
    :catch_0
    move-exception v2

    .line 39
    goto :goto_1

    .line 40
    :cond_2
    :goto_0
    const-string v2, " getScreenshot getScreenshot is null or recycled. "

    .line 41
    .line 42
    invoke-static {p0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 43
    .line 44
    .line 45
    return-object v0

    .line 46
    :catch_1
    move-exception v2

    .line 47
    move-object v1, v0

    .line 48
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v4, "getScreenshot Exception occur:"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {p0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method private h(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->r:Z

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->v(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    :cond_2
    :goto_0
    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 2
    .line 3
    const v1, 0x7f010035

    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->p:Landroid/view/animation/Animation;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v1, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->p:Landroid/view/animation/Animation;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->v:Landroid/view/animation/Animation$AnimationListener;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 27
    .line 28
    const v1, 0x7f010034

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q:Landroid/view/animation/Animation;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    sget-object v1, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q:Landroid/view/animation/Animation;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->w:Landroid/view/animation/Animation$AnimationListener;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method private k(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    sget-object v2, LL1/b;->a:[I

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    if-ne v1, p1, :cond_0

    .line 14
    .line 15
    new-instance v3, LL1/a;

    .line 16
    .line 17
    aget v2, v2, v1

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    invoke-direct {v3, v4, v2, v1}, LL1/a;-><init>(ZII)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    new-instance v3, LL1/a;

    .line 25
    .line 26
    aget v2, v2, v1

    .line 27
    .line 28
    invoke-direct {v3, v0, v2, v1}, LL1/a;-><init>(ZII)V

    .line 29
    .line 30
    .line 31
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->t:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    const-string v0, "DesktopClockSettingsActivity"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "registerTimeChangedReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/content/IntentFilter;

    .line 9
    .line 10
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "android.intent.action.TIME_TICK"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v2, "android.intent.action.TIME_SET"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "android.intent.action.TIMEZONE_CHANGED"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->x:Landroid/content/BroadcastReceiver;

    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    invoke-virtual {v2, p0, v1, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    const-string v1, "registerTimeChangedReceiver error"

    .line 39
    .line 40
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private n()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const v1, 0x7f0e0092

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setCustomView(I)V

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 16
    .line 17
    .line 18
    const v1, 0x7f0b003e

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/widget/ImageView;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->l:Landroid/widget/ImageView;

    .line 28
    .line 29
    const v1, 0x7f0b0043

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Landroid/widget/TextView;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->m:Landroid/widget/TextView;

    .line 39
    .line 40
    const v1, 0x7f0b00ea

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$a;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$a;-><init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    const v0, 0x7f0b01b2

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/view/ViewGroup;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const v2, 0x7f0701ca

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    invoke-static {v1, p0}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    neg-int p0, p0

    .line 93
    int-to-float p0, p0

    .line 94
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method private o()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->l:Landroid/widget/ImageView;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->m:Landroid/widget/TextView;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method private p()V
    .locals 0

    .line 1
    return-void
.end method

.method private s(ZI)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    new-array v0, v0, [F

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0x50

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-array v0, v0, [F

    .line 20
    .line 21
    fill-array-data v0, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide/16 v1, 0x190

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->u:Landroid/view/animation/PathInterpolator;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$b;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$b;-><init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$c;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity$c;-><init>(Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;ZI)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    nop

    .line 59
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private u()V
    .locals 2

    .line 1
    const-string v0, "DesktopClockSettingsActivity"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "unregisterTimeChangedReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->x:Landroid/content/BroadcastReceiver;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    const-string v1, "unregisterTimeChangedReceiver error"

    .line 18
    .line 19
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private v(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->s(ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a(IZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->r:Z

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->s:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected i()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0xf06

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 20
    .line 21
    return-void
.end method

.method public l()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const v3, 0x7f07009e

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 39
    .line 40
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const v3, 0x7f07009f

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {v1, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const v2, 0x7f0701c8

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-static {v0, v1}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 94
    .line 95
    const/4 v2, 0x0

    .line 96
    invoke-virtual {v1, v2, v2, v2, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 106
    .line 107
    if-eqz v0, :cond_1

    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 110
    .line 111
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    const v3, 0x7f0701c7

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v4, "mEditLayout. measureHeight = "

    .line 132
    .line 133
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v4, ", fixEditHeight = "

    .line 140
    .line 141
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    const-string v4, "DesktopClockSettingsActivity"

    .line 152
    .line 153
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    if-le v1, v2, :cond_1

    .line 157
    .line 158
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 159
    .line 160
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    .line 164
    .line 165
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p1, 0x0

    .line 19
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "onClick bHide = "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "DesktopClockSettingsActivity"

    .line 37
    .line 38
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->r()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->i()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->t()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "onCreate"

    .line 5
    .line 6
    const-string v0, "DesktopClockSettingsActivity"

    .line 7
    .line 8
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iput-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->p()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->n()V

    .line 24
    .line 25
    .line 26
    :goto_0
    const p1, 0x7f0e00ba

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    .line 30
    .line 31
    .line 32
    const p1, 0x7f0b0164

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Landroid/widget/LinearLayout;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    const p1, 0x7f0b0555

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 53
    .line 54
    const p1, 0x7f0b0509

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Landroid/widget/ImageView;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->i:Landroid/widget/ImageView;

    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g:Landroid/content/Context;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-boolean v1, p1, Lcom/android/launcher3/r4;->l:Z

    .line 76
    .line 77
    iput-boolean v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->r:Z

    .line 78
    .line 79
    iget-object p1, p1, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 80
    .line 81
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->s:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v1, p1}, LL1/b;->a(ZLjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 88
    .line 89
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v1, "mCurrentClockIndex = "

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    iget-boolean p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->r:Z

    .line 112
    .line 113
    if-eqz p1, :cond_1

    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->h:Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;

    .line 116
    .line 117
    iget v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockStyleItem;->b(I)V

    .line 120
    .line 121
    .line 122
    :cond_1
    iget p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 123
    .line 124
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k(I)V

    .line 125
    .line 126
    .line 127
    const p1, 0x7f0b03af

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;

    .line 135
    .line 136
    iput-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->j:Lcom/android/launcher3/settings/desktopclock/MenuEffectView;

    .line 137
    .line 138
    iget v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o:I

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->setSelectedIndex(I)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->j:Lcom/android/launcher3/settings/desktopclock/MenuEffectView;

    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->t:Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->setDataList(Ljava/util/ArrayList;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->j:Lcom/android/launcher3/settings/desktopclock/MenuEffectView;

    .line 151
    .line 152
    invoke-virtual {p1, p0}, Lcom/android/launcher3/settings/desktopclock/MenuEffectView;->setOnItemClickListener(Lcom/android/launcher3/settings/desktopclock/MenuEffectView$a;)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-nez p1, :cond_2

    .line 160
    .line 161
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->j()V

    .line 162
    .line 163
    .line 164
    :cond_2
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x102002c

    .line 6
    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method protected onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->u()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->o()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "showStatusBar = "

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "DesktopClockSettingsActivity"

    .line 42
    .line 43
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q()V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->i()V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->g()Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->i:Landroid/widget/ImageView;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->m()V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->f()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->l()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method protected q()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0xc000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->n:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/16 v1, 0xf00

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/16 v1, 0x2f10

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    const/high16 p0, -0x80000000

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroid/view/Window;->addFlags(I)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    invoke-virtual {v0, p0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 40
    .line 41
    .line 42
    const/4 p0, -0x1

    .line 43
    invoke-virtual {v0, p0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    or-int/lit8 p0, p0, 0x10

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1, p0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const/4 v0, 0x1

    .line 68
    iput v0, p0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 69
    .line 70
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q:Landroid/view/animation/Animation;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->clearAnimation()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q:Landroid/view/animation/Animation;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->q:Landroid/view/animation/Animation;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "DesktopClockSettingsActivity"

    .line 34
    .line 35
    const-string v0, "startAnimation "

    .line 36
    .line 37
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->p:Landroid/view/animation/Animation;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->clearAnimation()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->p:Landroid/view/animation/Animation;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->k:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/settings/desktopclock/DesktopClockSettingsActivity;->p:Landroid/view/animation/Animation;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method
