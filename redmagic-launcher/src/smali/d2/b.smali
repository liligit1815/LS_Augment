.class public final synthetic Ld2/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/p;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

.field public final synthetic h:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

.field public final synthetic i:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/content/SharedPreferences;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/b;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 5
    .line 6
    iput-object p2, p0, Ld2/b;->h:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 7
    .line 8
    iput-object p3, p0, Ld2/b;->i:Landroid/content/SharedPreferences;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ld2/b;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 2
    .line 3
    iget-object v1, p0, Ld2/b;->h:Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 4
    .line 5
    iget-object p0, p0, Ld2/b;->i:Landroid/content/SharedPreferences;

    .line 6
    .line 7
    check-cast p1, Landroidx/preference/h;

    .line 8
    .line 9
    check-cast p2, Landroidx/preference/Preference;

    .line 10
    .line 11
    invoke-static {v0, v1, p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->B1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;Landroid/content/SharedPreferences;Landroidx/preference/h;Landroidx/preference/Preference;)Lh4/t;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
