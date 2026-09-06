.class final Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;
.super Landroidx/preference/Preference;
.source "DevOptionsUiHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "b"
.end annotation


# instance fields
.field private final W:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Landroidx/preference/h;",
            "Landroidx/preference/Preference;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic X:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lu4/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/p<",
            "-",
            "Landroidx/preference/h;",
            "-",
            "Landroidx/preference/Preference;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "bindCallback"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;->X:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/preference/Preference;->k()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;->W:Lu4/p;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public W(Landroidx/preference/h;)V
    .locals 1

    .line 1
    const-string v0, "holder"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroidx/preference/Preference;->W(Landroidx/preference/h;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$b;->W:Lu4/p;

    .line 10
    .line 11
    invoke-interface {v0, p1, p0}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method
