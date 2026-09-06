.class public final synthetic Ld2/o;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/o;->g:Landroid/content/SharedPreferences;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ld2/o;->g:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    check-cast p1, Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->C1(Landroid/content/SharedPreferences;Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
