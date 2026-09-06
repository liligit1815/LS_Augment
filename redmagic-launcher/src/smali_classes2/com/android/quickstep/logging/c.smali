.class public final synthetic Lcom/android/quickstep/logging/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/logging/StatsLogManager$i;

.field public final synthetic b:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/logging/StatsLogManager$i;Landroid/content/SharedPreferences;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/logging/c;->a:Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/logging/c;->b:Landroid/content/SharedPreferences;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/c;->a:Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/logging/c;->b:Landroid/content/SharedPreferences;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    check-cast p2, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/logging/SettingsChangeLogger;->a(Lcom/android/launcher3/logging/StatsLogManager$i;Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
