.class public final Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;
.super Ljava/lang/Object;
.source "SettingsChangeLogger_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/logging/SettingsChangeLogger;",
        ">;"
    }
.end annotation


# instance fields
.field private final contextProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final displayControllerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;"
        }
    .end annotation
.end field

.field private final settingsCacheProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;"
        }
    .end annotation
.end field

.field private final trackerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->contextProvider:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->trackerProvider:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->displayControllerProvider:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->settingsCacheProvider:Lg4/a;

    .line 11
    .line 12
    return-void
.end method

.method public static create(Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;)",
            "Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/p2;)Lcom/android/quickstep/logging/SettingsChangeLogger;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/logging/SettingsChangeLogger;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/logging/SettingsChangeLogger;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/p2;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/logging/SettingsChangeLogger;
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->contextProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->trackerProvider:Lg4/a;

    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/util/K;

    iget-object v2, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->displayControllerProvider:Lg4/a;

    invoke-interface {v2}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher3/util/Z;

    iget-object p0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->settingsCacheProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/util/p2;

    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->newInstance(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/p2;)Lcom/android/quickstep/logging/SettingsChangeLogger;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/logging/SettingsChangeLogger_Factory;->get()Lcom/android/quickstep/logging/SettingsChangeLogger;

    move-result-object p0

    return-object p0
.end method
