.class public final Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$e;
.super Ljava/lang/Object;
.source "TextView.kt"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->W(Landroidx/preference/h;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$e;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 8

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "getDefault(...)"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string p1, "toLowerCase(...)"

    .line 19
    .line 20
    invoke-static {v2, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v6, 0x4

    .line 24
    const/4 v7, 0x0

    .line 25
    const-string v3, "_"

    .line 26
    .line 27
    const-string v4, " "

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    invoke-static/range {v2 .. v7}, LD4/g;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$e;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 35
    .line 36
    invoke-static {v0, p1, v0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->D1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Ljava/lang/String;Landroidx/preference/PreferenceGroup;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$e;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->N0(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
