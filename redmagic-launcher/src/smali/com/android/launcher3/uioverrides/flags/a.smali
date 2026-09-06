.class public final synthetic Lcom/android/launcher3/uioverrides/flags/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/preference/Preference$d;


# instance fields
.field public final synthetic g:Landroid/content/SharedPreferences;

.field public final synthetic h:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

.field public final synthetic i:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;

.field public final synthetic j:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/flags/a;->g:Landroid/content/SharedPreferences;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/flags/a;->h:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/uioverrides/flags/a;->i:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/uioverrides/flags/a;->j:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final d(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/flags/a;->g:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/flags/a;->h:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/flags/a;->i:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/flags/a;->j:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 8
    .line 9
    move-object v4, p1

    .line 10
    move-object v5, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->z1(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper$c;Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroidx/preference/Preference;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
