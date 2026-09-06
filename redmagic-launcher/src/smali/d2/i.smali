.class public final synthetic Ld2/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic g:Landroid/content/SharedPreferences;

.field public final synthetic h:Landroidx/preference/SwitchPreference;

.field public final synthetic i:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

.field public final synthetic j:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Landroidx/preference/SwitchPreference;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/i;->g:Landroid/content/SharedPreferences;

    .line 5
    .line 6
    iput-object p2, p0, Ld2/i;->h:Landroidx/preference/SwitchPreference;

    .line 7
    .line 8
    iput-object p3, p0, Ld2/i;->i:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 9
    .line 10
    iput-object p4, p0, Ld2/i;->j:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ld2/i;->g:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    iget-object v1, p0, Ld2/i;->h:Landroidx/preference/SwitchPreference;

    .line 4
    .line 5
    iget-object v2, p0, Ld2/i;->i:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 6
    .line 7
    iget-object p0, p0, Ld2/i;->j:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->s1(Landroid/content/SharedPreferences;Landroidx/preference/SwitchPreference;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
