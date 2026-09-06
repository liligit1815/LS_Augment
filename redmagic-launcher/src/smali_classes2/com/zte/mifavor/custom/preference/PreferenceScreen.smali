.class public Lcom/zte/mifavor/custom/preference/PreferenceScreen;
.super Ljava/lang/Object;
.source "PreferenceScreen.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PreferenceScreen"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static showDialog_handleDialog([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Landroid/content/Context;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object p0, p0, v1

    .line 8
    .line 9
    check-cast p0, Landroid/app/Dialog;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_0
    const-string v0, "PreferenceScreen"

    .line 20
    .line 21
    const-string v3, "showDialog_handleDialog"

    .line 22
    .line 23
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Dialog;->getActionBar()Landroid/app/ActionBar;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "id"

    .line 37
    .line 38
    const-string v5, "android"

    .line 39
    .line 40
    const-string v6, "action_bar"

    .line 41
    .line 42
    invoke-virtual {v3, v6, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4, v3}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    instance-of v4, v3, Landroid/widget/Toolbar;

    .line 55
    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 59
    .line 60
    .line 61
    check-cast v3, Landroid/widget/Toolbar;

    .line 62
    .line 63
    new-instance v0, Lcom/zte/mifavor/custom/preference/PreferenceScreen$1;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lcom/zte/mifavor/custom/preference/PreferenceScreen$1;-><init>(Landroid/app/Dialog;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3, v0}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-object v2
.end method
