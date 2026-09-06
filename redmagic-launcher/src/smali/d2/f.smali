.class public final synthetic Ld2/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic g:Landroid/content/SharedPreferences;

.field public final synthetic h:Landroidx/preference/Preference;

.field public final synthetic i:Lcom/android/launcher3/ExtendedEditText;

.field public final synthetic j:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

.field public final synthetic k:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/f;->g:Landroid/content/SharedPreferences;

    .line 5
    .line 6
    iput-object p2, p0, Ld2/f;->h:Landroidx/preference/Preference;

    .line 7
    .line 8
    iput-object p3, p0, Ld2/f;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 9
    .line 10
    iput-object p4, p0, Ld2/f;->j:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 11
    .line 12
    iput-object p5, p0, Ld2/f;->k:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ld2/f;->g:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    iget-object v1, p0, Ld2/f;->h:Landroidx/preference/Preference;

    .line 4
    .line 5
    iget-object v2, p0, Ld2/f;->i:Lcom/android/launcher3/ExtendedEditText;

    .line 6
    .line 7
    iget-object v3, p0, Ld2/f;->j:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 8
    .line 9
    iget-object v4, p0, Ld2/f;->k:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    move v6, p2

    .line 13
    move-object v7, p3

    .line 14
    invoke-static/range {v0 .. v7}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->v1(Landroid/content/SharedPreferences;Landroidx/preference/Preference;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method
