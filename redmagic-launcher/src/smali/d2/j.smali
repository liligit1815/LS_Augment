.class public final synthetic Ld2/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/j;->g:Landroidx/preference/Preference;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ld2/j;->g:Landroidx/preference/Preference;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->j1(Landroidx/preference/Preference;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
