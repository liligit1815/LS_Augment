.class public final synthetic Lcom/android/quickstep/util/V;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/DeviceConfigHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/DeviceConfigHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/V;->g:Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/V;->g:Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/util/DeviceConfigHelper;->d(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
