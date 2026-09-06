.class public Lcom/zte/mifavor/custom/preference/EditTextPreference;
.super Ljava/lang/Object;
.source "EditTextPreference.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "EditTextPreference"


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

.method public static onAddEditTextToDialogView_getContainer([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v0, p0, v0

    .line 3
    .line 4
    check-cast v0, Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    check-cast v1, Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    const-string v2, "EditTextPreference"

    .line 23
    .line 24
    const-string v3, "onAddEditTextToDialogView_getContainer"

    .line 25
    .line 26
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    array-length v2, p0

    .line 30
    const/4 v3, 0x2

    .line 31
    if-le v2, v3, :cond_1

    .line 32
    .line 33
    aget-object p0, p0, v3

    .line 34
    .line 35
    check-cast p0, Landroid/widget/EditText;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    .line 40
    .line 41
    .line 42
    :cond_1
    if-nez v1, :cond_2

    .line 43
    .line 44
    const p0, 0x1020002

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_2
    return-object v1
.end method
