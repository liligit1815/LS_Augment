.class public Lcom/android/launcher3/settings/FeaturePhoneModeActivity;
.super LK1/p;
.source "FeaturePhoneModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private D:Lcom/zte/mifavor/widget/ButtonZTE;

.field private E:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/p;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private p0()V
    .locals 1

    .line 1
    const v0, 0x7f0b0541

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/zte/mifavor/widget/ButtonZTE;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;->D:Lcom/zte/mifavor/widget/ButtonZTE;

    .line 11
    .line 12
    const v0, 0x7f0b0545

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/widget/TextView;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;->E:Landroid/widget/TextView;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;->D:Lcom/zte/mifavor/widget/ButtonZTE;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private q0()V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lx1/O;->I4(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "content://com.zte.easymode.settings.SettingsProvider"

    .line 9
    .line 10
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v1, "feature_mode_set"

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const v0, 0x7f0b0541

    .line 6
    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;->q0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, LK1/p;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7f14037f

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const v0, 0x7f0e01fc

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, p1, v0, v1}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/settings/FeaturePhoneModeActivity;->p0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
