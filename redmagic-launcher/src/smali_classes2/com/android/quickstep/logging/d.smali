.class public final synthetic Lcom/android/quickstep/logging/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/logging/StatsLogManager$d;


# instance fields
.field public final synthetic g:Landroid/content/SharedPreferences;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/logging/d;->g:Landroid/content/SharedPreferences;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/logging/d;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/logging/d;->i:Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getId()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/d;->g:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/logging/d;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/logging/d;->i:Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/logging/SettingsChangeLogger;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
